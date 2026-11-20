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
import { gridIconName } from '../model/DragExchangeLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_DragAndExchange]';
const BUNDLE: string = 'DragAndExchange_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for gridIconName (96 cases). */
export default function gridIconNameTest(): void {
  describe('GridIconNameTest', (): void => {
    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0001
     * @tc.name      DragAndExchange_GridIconName_0001
     * @tc.desc      gridIconName(index=0) returns "drag_and_exchange_ic_public_app0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('DragAndExchange_GridIconName_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}GridIconName_0001 begin`);
      const actual: string = gridIconName(0);
      logInfo(`gridIconName(index=0): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app0');
      logInfo(`${BUNDLE}GridIconName_0001 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0002
     * @tc.name      DragAndExchange_GridIconName_0002
     * @tc.desc      gridIconName(index=1) returns "drag_and_exchange_ic_public_app1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('DragAndExchange_GridIconName_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}GridIconName_0002 begin`);
      const actual: string = gridIconName(1);
      logInfo(`gridIconName(index=1): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app1');
      logInfo(`${BUNDLE}GridIconName_0002 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0003
     * @tc.name      DragAndExchange_GridIconName_0003
     * @tc.desc      gridIconName(index=2) returns "drag_and_exchange_ic_public_app2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0003 begin`);
      const actual: string = gridIconName(2);
      logInfo(`gridIconName(index=2): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app2');
      logInfo(`${BUNDLE}GridIconName_0003 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0004
     * @tc.name      DragAndExchange_GridIconName_0004
     * @tc.desc      gridIconName(index=-1) returns "drag_and_exchange_ic_public_app-1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridIconName_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridIconName_0004 begin`);
      const actual: string = gridIconName(-1);
      logInfo(`gridIconName(index=-1): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app-1');
      logInfo(`${BUNDLE}GridIconName_0004 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0005
     * @tc.name      DragAndExchange_GridIconName_0005
     * @tc.desc      gridIconName(index=5) returns "drag_and_exchange_ic_public_app5"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0005 begin`);
      const actual: string = gridIconName(5);
      logInfo(`gridIconName(index=5): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app5');
      logInfo(`${BUNDLE}GridIconName_0005 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0006
     * @tc.name      DragAndExchange_GridIconName_0006
     * @tc.desc      gridIconName(index=10) returns "drag_and_exchange_ic_public_app10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0006 begin`);
      const actual: string = gridIconName(10);
      logInfo(`gridIconName(index=10): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app10');
      logInfo(`${BUNDLE}GridIconName_0006 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0007
     * @tc.name      DragAndExchange_GridIconName_0007
     * @tc.desc      gridIconName(index=3) returns "drag_and_exchange_ic_public_app3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0007 begin`);
      const actual: string = gridIconName(3);
      logInfo(`gridIconName(index=3): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app3');
      logInfo(`${BUNDLE}GridIconName_0007 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0008
     * @tc.name      DragAndExchange_GridIconName_0008
     * @tc.desc      gridIconName(index=100) returns "drag_and_exchange_ic_public_app100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0008 begin`);
      const actual: string = gridIconName(100);
      logInfo(`gridIconName(index=100): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app100');
      logInfo(`${BUNDLE}GridIconName_0008 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0009
     * @tc.name      DragAndExchange_GridIconName_0009
     * @tc.desc      gridIconName(index=15) returns "drag_and_exchange_ic_public_app15"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0009 begin`);
      const actual: string = gridIconName(15);
      logInfo(`gridIconName(index=15): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app15');
      logInfo(`${BUNDLE}GridIconName_0009 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0010
     * @tc.name      DragAndExchange_GridIconName_0010
     * @tc.desc      gridIconName(index=20) returns "drag_and_exchange_ic_public_app20"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0010 begin`);
      const actual: string = gridIconName(20);
      logInfo(`gridIconName(index=20): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app20');
      logInfo(`${BUNDLE}GridIconName_0010 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0011
     * @tc.name      DragAndExchange_GridIconName_0011
     * @tc.desc      gridIconName(index=25) returns "drag_and_exchange_ic_public_app25"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0011 begin`);
      const actual: string = gridIconName(25);
      logInfo(`gridIconName(index=25): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app25');
      logInfo(`${BUNDLE}GridIconName_0011 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0012
     * @tc.name      DragAndExchange_GridIconName_0012
     * @tc.desc      gridIconName(index=30) returns "drag_and_exchange_ic_public_app30"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0012 begin`);
      const actual: string = gridIconName(30);
      logInfo(`gridIconName(index=30): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app30');
      logInfo(`${BUNDLE}GridIconName_0012 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0013
     * @tc.name      DragAndExchange_GridIconName_0013
     * @tc.desc      gridIconName(index=35) returns "drag_and_exchange_ic_public_app35"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0013 begin`);
      const actual: string = gridIconName(35);
      logInfo(`gridIconName(index=35): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app35');
      logInfo(`${BUNDLE}GridIconName_0013 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0014
     * @tc.name      DragAndExchange_GridIconName_0014
     * @tc.desc      gridIconName(index=40) returns "drag_and_exchange_ic_public_app40"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0014 begin`);
      const actual: string = gridIconName(40);
      logInfo(`gridIconName(index=40): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app40');
      logInfo(`${BUNDLE}GridIconName_0014 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0015
     * @tc.name      DragAndExchange_GridIconName_0015
     * @tc.desc      gridIconName(index=45) returns "drag_and_exchange_ic_public_app45"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0015 begin`);
      const actual: string = gridIconName(45);
      logInfo(`gridIconName(index=45): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app45');
      logInfo(`${BUNDLE}GridIconName_0015 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0016
     * @tc.name      DragAndExchange_GridIconName_0016
     * @tc.desc      gridIconName(index=50) returns "drag_and_exchange_ic_public_app50"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0016 begin`);
      const actual: string = gridIconName(50);
      logInfo(`gridIconName(index=50): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app50');
      logInfo(`${BUNDLE}GridIconName_0016 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0017
     * @tc.name      DragAndExchange_GridIconName_0017
     * @tc.desc      gridIconName(index=55) returns "drag_and_exchange_ic_public_app55"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0017 begin`);
      const actual: string = gridIconName(55);
      logInfo(`gridIconName(index=55): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app55');
      logInfo(`${BUNDLE}GridIconName_0017 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0018
     * @tc.name      DragAndExchange_GridIconName_0018
     * @tc.desc      gridIconName(index=60) returns "drag_and_exchange_ic_public_app60"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0018 begin`);
      const actual: string = gridIconName(60);
      logInfo(`gridIconName(index=60): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app60');
      logInfo(`${BUNDLE}GridIconName_0018 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0019
     * @tc.name      DragAndExchange_GridIconName_0019
     * @tc.desc      gridIconName(index=65) returns "drag_and_exchange_ic_public_app65"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0019 begin`);
      const actual: string = gridIconName(65);
      logInfo(`gridIconName(index=65): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app65');
      logInfo(`${BUNDLE}GridIconName_0019 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0020
     * @tc.name      DragAndExchange_GridIconName_0020
     * @tc.desc      gridIconName(index=70) returns "drag_and_exchange_ic_public_app70"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0020 begin`);
      const actual: string = gridIconName(70);
      logInfo(`gridIconName(index=70): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app70');
      logInfo(`${BUNDLE}GridIconName_0020 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0021
     * @tc.name      DragAndExchange_GridIconName_0021
     * @tc.desc      gridIconName(index=75) returns "drag_and_exchange_ic_public_app75"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0021 begin`);
      const actual: string = gridIconName(75);
      logInfo(`gridIconName(index=75): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app75');
      logInfo(`${BUNDLE}GridIconName_0021 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0022
     * @tc.name      DragAndExchange_GridIconName_0022
     * @tc.desc      gridIconName(index=80) returns "drag_and_exchange_ic_public_app80"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0022 begin`);
      const actual: string = gridIconName(80);
      logInfo(`gridIconName(index=80): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app80');
      logInfo(`${BUNDLE}GridIconName_0022 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0023
     * @tc.name      DragAndExchange_GridIconName_0023
     * @tc.desc      gridIconName(index=85) returns "drag_and_exchange_ic_public_app85"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0023 begin`);
      const actual: string = gridIconName(85);
      logInfo(`gridIconName(index=85): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app85');
      logInfo(`${BUNDLE}GridIconName_0023 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0024
     * @tc.name      DragAndExchange_GridIconName_0024
     * @tc.desc      gridIconName(index=90) returns "drag_and_exchange_ic_public_app90"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0024 begin`);
      const actual: string = gridIconName(90);
      logInfo(`gridIconName(index=90): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app90');
      logInfo(`${BUNDLE}GridIconName_0024 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0025
     * @tc.name      DragAndExchange_GridIconName_0025
     * @tc.desc      gridIconName(index=95) returns "drag_and_exchange_ic_public_app95"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0025 begin`);
      const actual: string = gridIconName(95);
      logInfo(`gridIconName(index=95): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app95');
      logInfo(`${BUNDLE}GridIconName_0025 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0026
     * @tc.name      DragAndExchange_GridIconName_0026
     * @tc.desc      gridIconName(index=105) returns "drag_and_exchange_ic_public_app105"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0026 begin`);
      const actual: string = gridIconName(105);
      logInfo(`gridIconName(index=105): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app105');
      logInfo(`${BUNDLE}GridIconName_0026 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0027
     * @tc.name      DragAndExchange_GridIconName_0027
     * @tc.desc      gridIconName(index=110) returns "drag_and_exchange_ic_public_app110"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0027 begin`);
      const actual: string = gridIconName(110);
      logInfo(`gridIconName(index=110): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app110');
      logInfo(`${BUNDLE}GridIconName_0027 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0028
     * @tc.name      DragAndExchange_GridIconName_0028
     * @tc.desc      gridIconName(index=115) returns "drag_and_exchange_ic_public_app115"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0028 begin`);
      const actual: string = gridIconName(115);
      logInfo(`gridIconName(index=115): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app115');
      logInfo(`${BUNDLE}GridIconName_0028 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0029
     * @tc.name      DragAndExchange_GridIconName_0029
     * @tc.desc      gridIconName(index=120) returns "drag_and_exchange_ic_public_app120"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0029 begin`);
      const actual: string = gridIconName(120);
      logInfo(`gridIconName(index=120): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app120');
      logInfo(`${BUNDLE}GridIconName_0029 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0030
     * @tc.name      DragAndExchange_GridIconName_0030
     * @tc.desc      gridIconName(index=125) returns "drag_and_exchange_ic_public_app125"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0030 begin`);
      const actual: string = gridIconName(125);
      logInfo(`gridIconName(index=125): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app125');
      logInfo(`${BUNDLE}GridIconName_0030 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0031
     * @tc.name      DragAndExchange_GridIconName_0031
     * @tc.desc      gridIconName(index=130) returns "drag_and_exchange_ic_public_app130"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0031 begin`);
      const actual: string = gridIconName(130);
      logInfo(`gridIconName(index=130): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app130');
      logInfo(`${BUNDLE}GridIconName_0031 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0032
     * @tc.name      DragAndExchange_GridIconName_0032
     * @tc.desc      gridIconName(index=135) returns "drag_and_exchange_ic_public_app135"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0032 begin`);
      const actual: string = gridIconName(135);
      logInfo(`gridIconName(index=135): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app135');
      logInfo(`${BUNDLE}GridIconName_0032 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0033
     * @tc.name      DragAndExchange_GridIconName_0033
     * @tc.desc      gridIconName(index=140) returns "drag_and_exchange_ic_public_app140"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0033 begin`);
      const actual: string = gridIconName(140);
      logInfo(`gridIconName(index=140): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app140');
      logInfo(`${BUNDLE}GridIconName_0033 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0034
     * @tc.name      DragAndExchange_GridIconName_0034
     * @tc.desc      gridIconName(index=145) returns "drag_and_exchange_ic_public_app145"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0034 begin`);
      const actual: string = gridIconName(145);
      logInfo(`gridIconName(index=145): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app145');
      logInfo(`${BUNDLE}GridIconName_0034 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0035
     * @tc.name      DragAndExchange_GridIconName_0035
     * @tc.desc      gridIconName(index=150) returns "drag_and_exchange_ic_public_app150"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0035 begin`);
      const actual: string = gridIconName(150);
      logInfo(`gridIconName(index=150): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app150');
      logInfo(`${BUNDLE}GridIconName_0035 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0036
     * @tc.name      DragAndExchange_GridIconName_0036
     * @tc.desc      gridIconName(index=155) returns "drag_and_exchange_ic_public_app155"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0036 begin`);
      const actual: string = gridIconName(155);
      logInfo(`gridIconName(index=155): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app155');
      logInfo(`${BUNDLE}GridIconName_0036 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0037
     * @tc.name      DragAndExchange_GridIconName_0037
     * @tc.desc      gridIconName(index=160) returns "drag_and_exchange_ic_public_app160"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0037 begin`);
      const actual: string = gridIconName(160);
      logInfo(`gridIconName(index=160): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app160');
      logInfo(`${BUNDLE}GridIconName_0037 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0038
     * @tc.name      DragAndExchange_GridIconName_0038
     * @tc.desc      gridIconName(index=165) returns "drag_and_exchange_ic_public_app165"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0038 begin`);
      const actual: string = gridIconName(165);
      logInfo(`gridIconName(index=165): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app165');
      logInfo(`${BUNDLE}GridIconName_0038 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0039
     * @tc.name      DragAndExchange_GridIconName_0039
     * @tc.desc      gridIconName(index=170) returns "drag_and_exchange_ic_public_app170"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0039 begin`);
      const actual: string = gridIconName(170);
      logInfo(`gridIconName(index=170): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app170');
      logInfo(`${BUNDLE}GridIconName_0039 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0040
     * @tc.name      DragAndExchange_GridIconName_0040
     * @tc.desc      gridIconName(index=175) returns "drag_and_exchange_ic_public_app175"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0040 begin`);
      const actual: string = gridIconName(175);
      logInfo(`gridIconName(index=175): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app175');
      logInfo(`${BUNDLE}GridIconName_0040 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0041
     * @tc.name      DragAndExchange_GridIconName_0041
     * @tc.desc      gridIconName(index=180) returns "drag_and_exchange_ic_public_app180"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0041 begin`);
      const actual: string = gridIconName(180);
      logInfo(`gridIconName(index=180): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app180');
      logInfo(`${BUNDLE}GridIconName_0041 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0042
     * @tc.name      DragAndExchange_GridIconName_0042
     * @tc.desc      gridIconName(index=185) returns "drag_and_exchange_ic_public_app185"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0042 begin`);
      const actual: string = gridIconName(185);
      logInfo(`gridIconName(index=185): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app185');
      logInfo(`${BUNDLE}GridIconName_0042 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0043
     * @tc.name      DragAndExchange_GridIconName_0043
     * @tc.desc      gridIconName(index=190) returns "drag_and_exchange_ic_public_app190"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0043 begin`);
      const actual: string = gridIconName(190);
      logInfo(`gridIconName(index=190): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app190');
      logInfo(`${BUNDLE}GridIconName_0043 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0044
     * @tc.name      DragAndExchange_GridIconName_0044
     * @tc.desc      gridIconName(index=195) returns "drag_and_exchange_ic_public_app195"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0044 begin`);
      const actual: string = gridIconName(195);
      logInfo(`gridIconName(index=195): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app195');
      logInfo(`${BUNDLE}GridIconName_0044 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0045
     * @tc.name      DragAndExchange_GridIconName_0045
     * @tc.desc      gridIconName(index=200) returns "drag_and_exchange_ic_public_app200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0045 begin`);
      const actual: string = gridIconName(200);
      logInfo(`gridIconName(index=200): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app200');
      logInfo(`${BUNDLE}GridIconName_0045 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0046
     * @tc.name      DragAndExchange_GridIconName_0046
     * @tc.desc      gridIconName(index=-75) returns "drag_and_exchange_ic_public_app-75"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridIconName_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridIconName_0046 begin`);
      const actual: string = gridIconName(-75);
      logInfo(`gridIconName(index=-75): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app-75');
      logInfo(`${BUNDLE}GridIconName_0046 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0047
     * @tc.name      DragAndExchange_GridIconName_0047
     * @tc.desc      gridIconName(index=47.23) returns "drag_and_exchange_ic_public_app47.23"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0047 begin`);
      const actual: string = gridIconName(47.23);
      logInfo(`gridIconName(index=47.23): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app47.23');
      logInfo(`${BUNDLE}GridIconName_0047 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0048
     * @tc.name      DragAndExchange_GridIconName_0048
     * @tc.desc      gridIconName(index=9.11) returns "drag_and_exchange_ic_public_app9.11"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0048 begin`);
      const actual: string = gridIconName(9.11);
      logInfo(`gridIconName(index=9.11): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app9.11');
      logInfo(`${BUNDLE}GridIconName_0048 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0049
     * @tc.name      DragAndExchange_GridIconName_0049
     * @tc.desc      gridIconName(index=58) returns "drag_and_exchange_ic_public_app58"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0049 begin`);
      const actual: string = gridIconName(58);
      logInfo(`gridIconName(index=58): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app58');
      logInfo(`${BUNDLE}GridIconName_0049 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0050
     * @tc.name      DragAndExchange_GridIconName_0050
     * @tc.desc      gridIconName(index=16) returns "drag_and_exchange_ic_public_app16"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0050 begin`);
      const actual: string = gridIconName(16);
      logInfo(`gridIconName(index=16): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app16');
      logInfo(`${BUNDLE}GridIconName_0050 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0051
     * @tc.name      DragAndExchange_GridIconName_0051
     * @tc.desc      gridIconName(index=133) returns "drag_and_exchange_ic_public_app133"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0051 begin`);
      const actual: string = gridIconName(133);
      logInfo(`gridIconName(index=133): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app133');
      logInfo(`${BUNDLE}GridIconName_0051 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0052
     * @tc.name      DragAndExchange_GridIconName_0052
     * @tc.desc      gridIconName(index=-83) returns "drag_and_exchange_ic_public_app-83"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridIconName_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridIconName_0052 begin`);
      const actual: string = gridIconName(-83);
      logInfo(`gridIconName(index=-83): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app-83');
      logInfo(`${BUNDLE}GridIconName_0052 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0053
     * @tc.name      DragAndExchange_GridIconName_0053
     * @tc.desc      gridIconName(index=79.49) returns "drag_and_exchange_ic_public_app79.49"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0053 begin`);
      const actual: string = gridIconName(79.49);
      logInfo(`gridIconName(index=79.49): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app79.49');
      logInfo(`${BUNDLE}GridIconName_0053 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0054
     * @tc.name      DragAndExchange_GridIconName_0054
     * @tc.desc      gridIconName(index=-88) returns "drag_and_exchange_ic_public_app-88"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridIconName_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridIconName_0054 begin`);
      const actual: string = gridIconName(-88);
      logInfo(`gridIconName(index=-88): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app-88');
      logInfo(`${BUNDLE}GridIconName_0054 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0055
     * @tc.name      DragAndExchange_GridIconName_0055
     * @tc.desc      gridIconName(index=79.84) returns "drag_and_exchange_ic_public_app79.84"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0055 begin`);
      const actual: string = gridIconName(79.84);
      logInfo(`gridIconName(index=79.84): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app79.84');
      logInfo(`${BUNDLE}GridIconName_0055 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0056
     * @tc.name      DragAndExchange_GridIconName_0056
     * @tc.desc      gridIconName(index=98.46) returns "drag_and_exchange_ic_public_app98.46"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0056 begin`);
      const actual: string = gridIconName(98.46);
      logInfo(`gridIconName(index=98.46): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app98.46');
      logInfo(`${BUNDLE}GridIconName_0056 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0057
     * @tc.name      DragAndExchange_GridIconName_0057
     * @tc.desc      gridIconName(index=24.37) returns "drag_and_exchange_ic_public_app24.37"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0057 begin`);
      const actual: string = gridIconName(24.37);
      logInfo(`gridIconName(index=24.37): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app24.37');
      logInfo(`${BUNDLE}GridIconName_0057 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0058
     * @tc.name      DragAndExchange_GridIconName_0058
     * @tc.desc      gridIconName(index=67) returns "drag_and_exchange_ic_public_app67"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0058 begin`);
      const actual: string = gridIconName(67);
      logInfo(`gridIconName(index=67): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app67');
      logInfo(`${BUNDLE}GridIconName_0058 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0059
     * @tc.name      DragAndExchange_GridIconName_0059
     * @tc.desc      gridIconName(index=-19) returns "drag_and_exchange_ic_public_app-19"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridIconName_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridIconName_0059 begin`);
      const actual: string = gridIconName(-19);
      logInfo(`gridIconName(index=-19): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app-19');
      logInfo(`${BUNDLE}GridIconName_0059 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0060
     * @tc.name      DragAndExchange_GridIconName_0060
     * @tc.desc      gridIconName(index=16.96) returns "drag_and_exchange_ic_public_app16.96"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0060 begin`);
      const actual: string = gridIconName(16.96);
      logInfo(`gridIconName(index=16.96): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app16.96');
      logInfo(`${BUNDLE}GridIconName_0060 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0061
     * @tc.name      DragAndExchange_GridIconName_0061
     * @tc.desc      gridIconName(index=-3) returns "drag_and_exchange_ic_public_app-3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridIconName_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridIconName_0061 begin`);
      const actual: string = gridIconName(-3);
      logInfo(`gridIconName(index=-3): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app-3');
      logInfo(`${BUNDLE}GridIconName_0061 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0062
     * @tc.name      DragAndExchange_GridIconName_0062
     * @tc.desc      gridIconName(index=124) returns "drag_and_exchange_ic_public_app124"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0062 begin`);
      const actual: string = gridIconName(124);
      logInfo(`gridIconName(index=124): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app124');
      logInfo(`${BUNDLE}GridIconName_0062 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0063
     * @tc.name      DragAndExchange_GridIconName_0063
     * @tc.desc      gridIconName(index=-2) returns "drag_and_exchange_ic_public_app-2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridIconName_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridIconName_0063 begin`);
      const actual: string = gridIconName(-2);
      logInfo(`gridIconName(index=-2): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app-2');
      logInfo(`${BUNDLE}GridIconName_0063 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0064
     * @tc.name      DragAndExchange_GridIconName_0064
     * @tc.desc      gridIconName(index=57) returns "drag_and_exchange_ic_public_app57"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0064 begin`);
      const actual: string = gridIconName(57);
      logInfo(`gridIconName(index=57): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app57');
      logInfo(`${BUNDLE}GridIconName_0064 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0065
     * @tc.name      DragAndExchange_GridIconName_0065
     * @tc.desc      gridIconName(index=49) returns "drag_and_exchange_ic_public_app49"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0065 begin`);
      const actual: string = gridIconName(49);
      logInfo(`gridIconName(index=49): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app49');
      logInfo(`${BUNDLE}GridIconName_0065 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0066
     * @tc.name      DragAndExchange_GridIconName_0066
     * @tc.desc      gridIconName(index=27) returns "drag_and_exchange_ic_public_app27"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0066 begin`);
      const actual: string = gridIconName(27);
      logInfo(`gridIconName(index=27): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app27');
      logInfo(`${BUNDLE}GridIconName_0066 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0067
     * @tc.name      DragAndExchange_GridIconName_0067
     * @tc.desc      gridIconName(index=64.09) returns "drag_and_exchange_ic_public_app64.09"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0067 begin`);
      const actual: string = gridIconName(64.09);
      logInfo(`gridIconName(index=64.09): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app64.09');
      logInfo(`${BUNDLE}GridIconName_0067 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0068
     * @tc.name      DragAndExchange_GridIconName_0068
     * @tc.desc      gridIconName(index=109) returns "drag_and_exchange_ic_public_app109"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0068 begin`);
      const actual: string = gridIconName(109);
      logInfo(`gridIconName(index=109): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app109');
      logInfo(`${BUNDLE}GridIconName_0068 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0069
     * @tc.name      DragAndExchange_GridIconName_0069
     * @tc.desc      gridIconName(index=72) returns "drag_and_exchange_ic_public_app72"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0069 begin`);
      const actual: string = gridIconName(72);
      logInfo(`gridIconName(index=72): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app72');
      logInfo(`${BUNDLE}GridIconName_0069 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0070
     * @tc.name      DragAndExchange_GridIconName_0070
     * @tc.desc      gridIconName(index=54.66) returns "drag_and_exchange_ic_public_app54.66"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0070 begin`);
      const actual: string = gridIconName(54.66);
      logInfo(`gridIconName(index=54.66): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app54.66');
      logInfo(`${BUNDLE}GridIconName_0070 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0071
     * @tc.name      DragAndExchange_GridIconName_0071
     * @tc.desc      gridIconName(index=56) returns "drag_and_exchange_ic_public_app56"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0071 begin`);
      const actual: string = gridIconName(56);
      logInfo(`gridIconName(index=56): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app56');
      logInfo(`${BUNDLE}GridIconName_0071 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0072
     * @tc.name      DragAndExchange_GridIconName_0072
     * @tc.desc      gridIconName(index=87) returns "drag_and_exchange_ic_public_app87"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0072 begin`);
      const actual: string = gridIconName(87);
      logInfo(`gridIconName(index=87): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app87');
      logInfo(`${BUNDLE}GridIconName_0072 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0073
     * @tc.name      DragAndExchange_GridIconName_0073
     * @tc.desc      gridIconName(index=-29) returns "drag_and_exchange_ic_public_app-29"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridIconName_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridIconName_0073 begin`);
      const actual: string = gridIconName(-29);
      logInfo(`gridIconName(index=-29): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app-29');
      logInfo(`${BUNDLE}GridIconName_0073 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0074
     * @tc.name      DragAndExchange_GridIconName_0074
     * @tc.desc      gridIconName(index=55.72) returns "drag_and_exchange_ic_public_app55.72"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0074 begin`);
      const actual: string = gridIconName(55.72);
      logInfo(`gridIconName(index=55.72): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app55.72');
      logInfo(`${BUNDLE}GridIconName_0074 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0075
     * @tc.name      DragAndExchange_GridIconName_0075
     * @tc.desc      gridIconName(index=104) returns "drag_and_exchange_ic_public_app104"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0075 begin`);
      const actual: string = gridIconName(104);
      logInfo(`gridIconName(index=104): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app104');
      logInfo(`${BUNDLE}GridIconName_0075 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0076
     * @tc.name      DragAndExchange_GridIconName_0076
     * @tc.desc      gridIconName(index=-60) returns "drag_and_exchange_ic_public_app-60"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridIconName_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridIconName_0076 begin`);
      const actual: string = gridIconName(-60);
      logInfo(`gridIconName(index=-60): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app-60');
      logInfo(`${BUNDLE}GridIconName_0076 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0077
     * @tc.name      DragAndExchange_GridIconName_0077
     * @tc.desc      gridIconName(index=-18) returns "drag_and_exchange_ic_public_app-18"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridIconName_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridIconName_0077 begin`);
      const actual: string = gridIconName(-18);
      logInfo(`gridIconName(index=-18): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app-18');
      logInfo(`${BUNDLE}GridIconName_0077 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0078
     * @tc.name      DragAndExchange_GridIconName_0078
     * @tc.desc      gridIconName(index=-87) returns "drag_and_exchange_ic_public_app-87"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridIconName_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridIconName_0078 begin`);
      const actual: string = gridIconName(-87);
      logInfo(`gridIconName(index=-87): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app-87');
      logInfo(`${BUNDLE}GridIconName_0078 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0079
     * @tc.name      DragAndExchange_GridIconName_0079
     * @tc.desc      gridIconName(index=149) returns "drag_and_exchange_ic_public_app149"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0079 begin`);
      const actual: string = gridIconName(149);
      logInfo(`gridIconName(index=149): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app149');
      logInfo(`${BUNDLE}GridIconName_0079 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0080
     * @tc.name      DragAndExchange_GridIconName_0080
     * @tc.desc      gridIconName(index=23.35) returns "drag_and_exchange_ic_public_app23.35"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0080 begin`);
      const actual: string = gridIconName(23.35);
      logInfo(`gridIconName(index=23.35): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app23.35');
      logInfo(`${BUNDLE}GridIconName_0080 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0081
     * @tc.name      DragAndExchange_GridIconName_0081
     * @tc.desc      gridIconName(index=113) returns "drag_and_exchange_ic_public_app113"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0081 begin`);
      const actual: string = gridIconName(113);
      logInfo(`gridIconName(index=113): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app113');
      logInfo(`${BUNDLE}GridIconName_0081 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0082
     * @tc.name      DragAndExchange_GridIconName_0082
     * @tc.desc      gridIconName(index=69) returns "drag_and_exchange_ic_public_app69"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0082 begin`);
      const actual: string = gridIconName(69);
      logInfo(`gridIconName(index=69): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app69');
      logInfo(`${BUNDLE}GridIconName_0082 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0083
     * @tc.name      DragAndExchange_GridIconName_0083
     * @tc.desc      gridIconName(index=27.87) returns "drag_and_exchange_ic_public_app27.87"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0083 begin`);
      const actual: string = gridIconName(27.87);
      logInfo(`gridIconName(index=27.87): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app27.87');
      logInfo(`${BUNDLE}GridIconName_0083 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0084
     * @tc.name      DragAndExchange_GridIconName_0084
     * @tc.desc      gridIconName(index=35.53) returns "drag_and_exchange_ic_public_app35.53"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0084 begin`);
      const actual: string = gridIconName(35.53);
      logInfo(`gridIconName(index=35.53): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app35.53');
      logInfo(`${BUNDLE}GridIconName_0084 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0085
     * @tc.name      DragAndExchange_GridIconName_0085
     * @tc.desc      gridIconName(index=33.43) returns "drag_and_exchange_ic_public_app33.43"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0085 begin`);
      const actual: string = gridIconName(33.43);
      logInfo(`gridIconName(index=33.43): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app33.43');
      logInfo(`${BUNDLE}GridIconName_0085 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0086
     * @tc.name      DragAndExchange_GridIconName_0086
     * @tc.desc      gridIconName(index=152) returns "drag_and_exchange_ic_public_app152"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0086 begin`);
      const actual: string = gridIconName(152);
      logInfo(`gridIconName(index=152): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app152');
      logInfo(`${BUNDLE}GridIconName_0086 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0087
     * @tc.name      DragAndExchange_GridIconName_0087
     * @tc.desc      gridIconName(index=71.85) returns "drag_and_exchange_ic_public_app71.85"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0087 begin`);
      const actual: string = gridIconName(71.85);
      logInfo(`gridIconName(index=71.85): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app71.85');
      logInfo(`${BUNDLE}GridIconName_0087 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0088
     * @tc.name      DragAndExchange_GridIconName_0088
     * @tc.desc      gridIconName(index=36) returns "drag_and_exchange_ic_public_app36"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0088 begin`);
      const actual: string = gridIconName(36);
      logInfo(`gridIconName(index=36): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app36');
      logInfo(`${BUNDLE}GridIconName_0088 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0089
     * @tc.name      DragAndExchange_GridIconName_0089
     * @tc.desc      gridIconName(index=-16) returns "drag_and_exchange_ic_public_app-16"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridIconName_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridIconName_0089 begin`);
      const actual: string = gridIconName(-16);
      logInfo(`gridIconName(index=-16): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app-16');
      logInfo(`${BUNDLE}GridIconName_0089 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0090
     * @tc.name      DragAndExchange_GridIconName_0090
     * @tc.desc      gridIconName(index=-32) returns "drag_and_exchange_ic_public_app-32"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridIconName_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridIconName_0090 begin`);
      const actual: string = gridIconName(-32);
      logInfo(`gridIconName(index=-32): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app-32');
      logInfo(`${BUNDLE}GridIconName_0090 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0091
     * @tc.name      DragAndExchange_GridIconName_0091
     * @tc.desc      gridIconName(index=15.58) returns "drag_and_exchange_ic_public_app15.58"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0091 begin`);
      const actual: string = gridIconName(15.58);
      logInfo(`gridIconName(index=15.58): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app15.58');
      logInfo(`${BUNDLE}GridIconName_0091 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0092
     * @tc.name      DragAndExchange_GridIconName_0092
     * @tc.desc      gridIconName(index=11) returns "drag_and_exchange_ic_public_app11"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0092 begin`);
      const actual: string = gridIconName(11);
      logInfo(`gridIconName(index=11): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app11');
      logInfo(`${BUNDLE}GridIconName_0092 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0093
     * @tc.name      DragAndExchange_GridIconName_0093
     * @tc.desc      gridIconName(index=-46) returns "drag_and_exchange_ic_public_app-46"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridIconName_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridIconName_0093 begin`);
      const actual: string = gridIconName(-46);
      logInfo(`gridIconName(index=-46): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app-46');
      logInfo(`${BUNDLE}GridIconName_0093 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0094
     * @tc.name      DragAndExchange_GridIconName_0094
     * @tc.desc      gridIconName(index=117) returns "drag_and_exchange_ic_public_app117"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0094 begin`);
      const actual: string = gridIconName(117);
      logInfo(`gridIconName(index=117): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app117');
      logInfo(`${BUNDLE}GridIconName_0094 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0095
     * @tc.name      DragAndExchange_GridIconName_0095
     * @tc.desc      gridIconName(index=82) returns "drag_and_exchange_ic_public_app82"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0095 begin`);
      const actual: string = gridIconName(82);
      logInfo(`gridIconName(index=82): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app82');
      logInfo(`${BUNDLE}GridIconName_0095 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0096
     * @tc.name      DragAndExchange_GridIconName_0096
     * @tc.desc      gridIconName(index=52.34) returns "drag_and_exchange_ic_public_app52.34"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0096 begin`);
      const actual: string = gridIconName(52.34);
      logInfo(`gridIconName(index=52.34): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app52.34');
      logInfo(`${BUNDLE}GridIconName_0096 end`);
    });
  });
}
