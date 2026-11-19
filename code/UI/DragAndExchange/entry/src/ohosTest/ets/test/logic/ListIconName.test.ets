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
import { listIconName } from '../model/DragExchangeLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_DragAndExchange]';
const BUNDLE: string = 'DragAndExchange_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for listIconName (96 cases). */
export default function listIconNameTest(): void {
  describe('ListIconNameTest', (): void => {
    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0001
     * @tc.name      DragAndExchange_ListIconName_0001
     * @tc.desc      listIconName(index=0) returns "drag_and_exchange_ic_public_game1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('DragAndExchange_ListIconName_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}ListIconName_0001 begin`);
      const actual: string = listIconName(0);
      logInfo(`listIconName(index=0): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game1');
      logInfo(`${BUNDLE}ListIconName_0001 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0002
     * @tc.name      DragAndExchange_ListIconName_0002
     * @tc.desc      listIconName(index=1) returns "drag_and_exchange_ic_public_game2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('DragAndExchange_ListIconName_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}ListIconName_0002 begin`);
      const actual: string = listIconName(1);
      logInfo(`listIconName(index=1): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game2');
      logInfo(`${BUNDLE}ListIconName_0002 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0003
     * @tc.name      DragAndExchange_ListIconName_0003
     * @tc.desc      listIconName(index=2) returns "drag_and_exchange_ic_public_game3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_ListIconName_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ListIconName_0003 begin`);
      const actual: string = listIconName(2);
      logInfo(`listIconName(index=2): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game3');
      logInfo(`${BUNDLE}ListIconName_0003 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0004
     * @tc.name      DragAndExchange_ListIconName_0004
     * @tc.desc      listIconName(index=-1) returns "drag_and_exchange_ic_public_game0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListIconName_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListIconName_0004 begin`);
      const actual: string = listIconName(-1);
      logInfo(`listIconName(index=-1): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game0');
      logInfo(`${BUNDLE}ListIconName_0004 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0005
     * @tc.name      DragAndExchange_ListIconName_0005
     * @tc.desc      listIconName(index=5) returns "drag_and_exchange_ic_public_game6"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0005 begin`);
      const actual: string = listIconName(5);
      logInfo(`listIconName(index=5): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game6');
      logInfo(`${BUNDLE}ListIconName_0005 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0006
     * @tc.name      DragAndExchange_ListIconName_0006
     * @tc.desc      listIconName(index=10) returns "drag_and_exchange_ic_public_game11"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0006 begin`);
      const actual: string = listIconName(10);
      logInfo(`listIconName(index=10): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game11');
      logInfo(`${BUNDLE}ListIconName_0006 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0007
     * @tc.name      DragAndExchange_ListIconName_0007
     * @tc.desc      listIconName(index=3) returns "drag_and_exchange_ic_public_game4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0007 begin`);
      const actual: string = listIconName(3);
      logInfo(`listIconName(index=3): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game4');
      logInfo(`${BUNDLE}ListIconName_0007 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0008
     * @tc.name      DragAndExchange_ListIconName_0008
     * @tc.desc      listIconName(index=100) returns "drag_and_exchange_ic_public_game101"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0008 begin`);
      const actual: string = listIconName(100);
      logInfo(`listIconName(index=100): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game101');
      logInfo(`${BUNDLE}ListIconName_0008 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0009
     * @tc.name      DragAndExchange_ListIconName_0009
     * @tc.desc      listIconName(index=15) returns "drag_and_exchange_ic_public_game16"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0009 begin`);
      const actual: string = listIconName(15);
      logInfo(`listIconName(index=15): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game16');
      logInfo(`${BUNDLE}ListIconName_0009 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0010
     * @tc.name      DragAndExchange_ListIconName_0010
     * @tc.desc      listIconName(index=20) returns "drag_and_exchange_ic_public_game21"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0010 begin`);
      const actual: string = listIconName(20);
      logInfo(`listIconName(index=20): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game21');
      logInfo(`${BUNDLE}ListIconName_0010 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0011
     * @tc.name      DragAndExchange_ListIconName_0011
     * @tc.desc      listIconName(index=25) returns "drag_and_exchange_ic_public_game26"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0011 begin`);
      const actual: string = listIconName(25);
      logInfo(`listIconName(index=25): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game26');
      logInfo(`${BUNDLE}ListIconName_0011 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0012
     * @tc.name      DragAndExchange_ListIconName_0012
     * @tc.desc      listIconName(index=30) returns "drag_and_exchange_ic_public_game31"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0012 begin`);
      const actual: string = listIconName(30);
      logInfo(`listIconName(index=30): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game31');
      logInfo(`${BUNDLE}ListIconName_0012 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0013
     * @tc.name      DragAndExchange_ListIconName_0013
     * @tc.desc      listIconName(index=35) returns "drag_and_exchange_ic_public_game36"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0013 begin`);
      const actual: string = listIconName(35);
      logInfo(`listIconName(index=35): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game36');
      logInfo(`${BUNDLE}ListIconName_0013 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0014
     * @tc.name      DragAndExchange_ListIconName_0014
     * @tc.desc      listIconName(index=40) returns "drag_and_exchange_ic_public_game41"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0014 begin`);
      const actual: string = listIconName(40);
      logInfo(`listIconName(index=40): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game41');
      logInfo(`${BUNDLE}ListIconName_0014 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0015
     * @tc.name      DragAndExchange_ListIconName_0015
     * @tc.desc      listIconName(index=45) returns "drag_and_exchange_ic_public_game46"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0015 begin`);
      const actual: string = listIconName(45);
      logInfo(`listIconName(index=45): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game46');
      logInfo(`${BUNDLE}ListIconName_0015 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0016
     * @tc.name      DragAndExchange_ListIconName_0016
     * @tc.desc      listIconName(index=50) returns "drag_and_exchange_ic_public_game51"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0016 begin`);
      const actual: string = listIconName(50);
      logInfo(`listIconName(index=50): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game51');
      logInfo(`${BUNDLE}ListIconName_0016 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0017
     * @tc.name      DragAndExchange_ListIconName_0017
     * @tc.desc      listIconName(index=55) returns "drag_and_exchange_ic_public_game56"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0017 begin`);
      const actual: string = listIconName(55);
      logInfo(`listIconName(index=55): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game56');
      logInfo(`${BUNDLE}ListIconName_0017 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0018
     * @tc.name      DragAndExchange_ListIconName_0018
     * @tc.desc      listIconName(index=60) returns "drag_and_exchange_ic_public_game61"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0018 begin`);
      const actual: string = listIconName(60);
      logInfo(`listIconName(index=60): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game61');
      logInfo(`${BUNDLE}ListIconName_0018 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0019
     * @tc.name      DragAndExchange_ListIconName_0019
     * @tc.desc      listIconName(index=65) returns "drag_and_exchange_ic_public_game66"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0019 begin`);
      const actual: string = listIconName(65);
      logInfo(`listIconName(index=65): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game66');
      logInfo(`${BUNDLE}ListIconName_0019 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0020
     * @tc.name      DragAndExchange_ListIconName_0020
     * @tc.desc      listIconName(index=70) returns "drag_and_exchange_ic_public_game71"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0020 begin`);
      const actual: string = listIconName(70);
      logInfo(`listIconName(index=70): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game71');
      logInfo(`${BUNDLE}ListIconName_0020 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0021
     * @tc.name      DragAndExchange_ListIconName_0021
     * @tc.desc      listIconName(index=75) returns "drag_and_exchange_ic_public_game76"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0021 begin`);
      const actual: string = listIconName(75);
      logInfo(`listIconName(index=75): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game76');
      logInfo(`${BUNDLE}ListIconName_0021 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0022
     * @tc.name      DragAndExchange_ListIconName_0022
     * @tc.desc      listIconName(index=80) returns "drag_and_exchange_ic_public_game81"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0022 begin`);
      const actual: string = listIconName(80);
      logInfo(`listIconName(index=80): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game81');
      logInfo(`${BUNDLE}ListIconName_0022 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0023
     * @tc.name      DragAndExchange_ListIconName_0023
     * @tc.desc      listIconName(index=85) returns "drag_and_exchange_ic_public_game86"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0023 begin`);
      const actual: string = listIconName(85);
      logInfo(`listIconName(index=85): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game86');
      logInfo(`${BUNDLE}ListIconName_0023 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0024
     * @tc.name      DragAndExchange_ListIconName_0024
     * @tc.desc      listIconName(index=90) returns "drag_and_exchange_ic_public_game91"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0024 begin`);
      const actual: string = listIconName(90);
      logInfo(`listIconName(index=90): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game91');
      logInfo(`${BUNDLE}ListIconName_0024 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0025
     * @tc.name      DragAndExchange_ListIconName_0025
     * @tc.desc      listIconName(index=95) returns "drag_and_exchange_ic_public_game96"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0025 begin`);
      const actual: string = listIconName(95);
      logInfo(`listIconName(index=95): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game96');
      logInfo(`${BUNDLE}ListIconName_0025 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0026
     * @tc.name      DragAndExchange_ListIconName_0026
     * @tc.desc      listIconName(index=105) returns "drag_and_exchange_ic_public_game106"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0026 begin`);
      const actual: string = listIconName(105);
      logInfo(`listIconName(index=105): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game106');
      logInfo(`${BUNDLE}ListIconName_0026 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0027
     * @tc.name      DragAndExchange_ListIconName_0027
     * @tc.desc      listIconName(index=110) returns "drag_and_exchange_ic_public_game111"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0027 begin`);
      const actual: string = listIconName(110);
      logInfo(`listIconName(index=110): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game111');
      logInfo(`${BUNDLE}ListIconName_0027 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0028
     * @tc.name      DragAndExchange_ListIconName_0028
     * @tc.desc      listIconName(index=115) returns "drag_and_exchange_ic_public_game116"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0028 begin`);
      const actual: string = listIconName(115);
      logInfo(`listIconName(index=115): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game116');
      logInfo(`${BUNDLE}ListIconName_0028 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0029
     * @tc.name      DragAndExchange_ListIconName_0029
     * @tc.desc      listIconName(index=120) returns "drag_and_exchange_ic_public_game121"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0029 begin`);
      const actual: string = listIconName(120);
      logInfo(`listIconName(index=120): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game121');
      logInfo(`${BUNDLE}ListIconName_0029 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0030
     * @tc.name      DragAndExchange_ListIconName_0030
     * @tc.desc      listIconName(index=125) returns "drag_and_exchange_ic_public_game126"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0030 begin`);
      const actual: string = listIconName(125);
      logInfo(`listIconName(index=125): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game126');
      logInfo(`${BUNDLE}ListIconName_0030 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0031
     * @tc.name      DragAndExchange_ListIconName_0031
     * @tc.desc      listIconName(index=130) returns "drag_and_exchange_ic_public_game131"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0031 begin`);
      const actual: string = listIconName(130);
      logInfo(`listIconName(index=130): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game131');
      logInfo(`${BUNDLE}ListIconName_0031 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0032
     * @tc.name      DragAndExchange_ListIconName_0032
     * @tc.desc      listIconName(index=135) returns "drag_and_exchange_ic_public_game136"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0032 begin`);
      const actual: string = listIconName(135);
      logInfo(`listIconName(index=135): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game136');
      logInfo(`${BUNDLE}ListIconName_0032 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0033
     * @tc.name      DragAndExchange_ListIconName_0033
     * @tc.desc      listIconName(index=140) returns "drag_and_exchange_ic_public_game141"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0033 begin`);
      const actual: string = listIconName(140);
      logInfo(`listIconName(index=140): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game141');
      logInfo(`${BUNDLE}ListIconName_0033 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0034
     * @tc.name      DragAndExchange_ListIconName_0034
     * @tc.desc      listIconName(index=145) returns "drag_and_exchange_ic_public_game146"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0034 begin`);
      const actual: string = listIconName(145);
      logInfo(`listIconName(index=145): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game146');
      logInfo(`${BUNDLE}ListIconName_0034 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0035
     * @tc.name      DragAndExchange_ListIconName_0035
     * @tc.desc      listIconName(index=150) returns "drag_and_exchange_ic_public_game151"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0035 begin`);
      const actual: string = listIconName(150);
      logInfo(`listIconName(index=150): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game151');
      logInfo(`${BUNDLE}ListIconName_0035 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0036
     * @tc.name      DragAndExchange_ListIconName_0036
     * @tc.desc      listIconName(index=155) returns "drag_and_exchange_ic_public_game156"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0036 begin`);
      const actual: string = listIconName(155);
      logInfo(`listIconName(index=155): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game156');
      logInfo(`${BUNDLE}ListIconName_0036 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0037
     * @tc.name      DragAndExchange_ListIconName_0037
     * @tc.desc      listIconName(index=160) returns "drag_and_exchange_ic_public_game161"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0037 begin`);
      const actual: string = listIconName(160);
      logInfo(`listIconName(index=160): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game161');
      logInfo(`${BUNDLE}ListIconName_0037 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0038
     * @tc.name      DragAndExchange_ListIconName_0038
     * @tc.desc      listIconName(index=165) returns "drag_and_exchange_ic_public_game166"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0038 begin`);
      const actual: string = listIconName(165);
      logInfo(`listIconName(index=165): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game166');
      logInfo(`${BUNDLE}ListIconName_0038 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0039
     * @tc.name      DragAndExchange_ListIconName_0039
     * @tc.desc      listIconName(index=170) returns "drag_and_exchange_ic_public_game171"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0039 begin`);
      const actual: string = listIconName(170);
      logInfo(`listIconName(index=170): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game171');
      logInfo(`${BUNDLE}ListIconName_0039 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0040
     * @tc.name      DragAndExchange_ListIconName_0040
     * @tc.desc      listIconName(index=175) returns "drag_and_exchange_ic_public_game176"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0040 begin`);
      const actual: string = listIconName(175);
      logInfo(`listIconName(index=175): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game176');
      logInfo(`${BUNDLE}ListIconName_0040 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0041
     * @tc.name      DragAndExchange_ListIconName_0041
     * @tc.desc      listIconName(index=180) returns "drag_and_exchange_ic_public_game181"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0041 begin`);
      const actual: string = listIconName(180);
      logInfo(`listIconName(index=180): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game181');
      logInfo(`${BUNDLE}ListIconName_0041 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0042
     * @tc.name      DragAndExchange_ListIconName_0042
     * @tc.desc      listIconName(index=185) returns "drag_and_exchange_ic_public_game186"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0042 begin`);
      const actual: string = listIconName(185);
      logInfo(`listIconName(index=185): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game186');
      logInfo(`${BUNDLE}ListIconName_0042 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0043
     * @tc.name      DragAndExchange_ListIconName_0043
     * @tc.desc      listIconName(index=190) returns "drag_and_exchange_ic_public_game191"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0043 begin`);
      const actual: string = listIconName(190);
      logInfo(`listIconName(index=190): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game191');
      logInfo(`${BUNDLE}ListIconName_0043 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0044
     * @tc.name      DragAndExchange_ListIconName_0044
     * @tc.desc      listIconName(index=195) returns "drag_and_exchange_ic_public_game196"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0044 begin`);
      const actual: string = listIconName(195);
      logInfo(`listIconName(index=195): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game196');
      logInfo(`${BUNDLE}ListIconName_0044 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0045
     * @tc.name      DragAndExchange_ListIconName_0045
     * @tc.desc      listIconName(index=200) returns "drag_and_exchange_ic_public_game201"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0045 begin`);
      const actual: string = listIconName(200);
      logInfo(`listIconName(index=200): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game201');
      logInfo(`${BUNDLE}ListIconName_0045 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0046
     * @tc.name      DragAndExchange_ListIconName_0046
     * @tc.desc      listIconName(index=72.63) returns "drag_and_exchange_ic_public_game73.63"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0046 begin`);
      const actual: string = listIconName(72.63);
      logInfo(`listIconName(index=72.63): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game73.63');
      logInfo(`${BUNDLE}ListIconName_0046 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0047
     * @tc.name      DragAndExchange_ListIconName_0047
     * @tc.desc      listIconName(index=176) returns "drag_and_exchange_ic_public_game177"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0047 begin`);
      const actual: string = listIconName(176);
      logInfo(`listIconName(index=176): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game177');
      logInfo(`${BUNDLE}ListIconName_0047 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0048
     * @tc.name      DragAndExchange_ListIconName_0048
     * @tc.desc      listIconName(index=124) returns "drag_and_exchange_ic_public_game125"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0048 begin`);
      const actual: string = listIconName(124);
      logInfo(`listIconName(index=124): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game125');
      logInfo(`${BUNDLE}ListIconName_0048 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0049
     * @tc.name      DragAndExchange_ListIconName_0049
     * @tc.desc      listIconName(index=46) returns "drag_and_exchange_ic_public_game47"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0049 begin`);
      const actual: string = listIconName(46);
      logInfo(`listIconName(index=46): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game47');
      logInfo(`${BUNDLE}ListIconName_0049 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0050
     * @tc.name      DragAndExchange_ListIconName_0050
     * @tc.desc      listIconName(index=89) returns "drag_and_exchange_ic_public_game90"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0050 begin`);
      const actual: string = listIconName(89);
      logInfo(`listIconName(index=89): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game90');
      logInfo(`${BUNDLE}ListIconName_0050 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0051
     * @tc.name      DragAndExchange_ListIconName_0051
     * @tc.desc      listIconName(index=142) returns "drag_and_exchange_ic_public_game143"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0051 begin`);
      const actual: string = listIconName(142);
      logInfo(`listIconName(index=142): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game143');
      logInfo(`${BUNDLE}ListIconName_0051 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0052
     * @tc.name      DragAndExchange_ListIconName_0052
     * @tc.desc      listIconName(index=82) returns "drag_and_exchange_ic_public_game83"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0052 begin`);
      const actual: string = listIconName(82);
      logInfo(`listIconName(index=82): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game83');
      logInfo(`${BUNDLE}ListIconName_0052 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0053
     * @tc.name      DragAndExchange_ListIconName_0053
     * @tc.desc      listIconName(index=127) returns "drag_and_exchange_ic_public_game128"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0053 begin`);
      const actual: string = listIconName(127);
      logInfo(`listIconName(index=127): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game128');
      logInfo(`${BUNDLE}ListIconName_0053 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0054
     * @tc.name      DragAndExchange_ListIconName_0054
     * @tc.desc      listIconName(index=163) returns "drag_and_exchange_ic_public_game164"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0054 begin`);
      const actual: string = listIconName(163);
      logInfo(`listIconName(index=163): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game164');
      logInfo(`${BUNDLE}ListIconName_0054 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0055
     * @tc.name      DragAndExchange_ListIconName_0055
     * @tc.desc      listIconName(index=103) returns "drag_and_exchange_ic_public_game104"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0055 begin`);
      const actual: string = listIconName(103);
      logInfo(`listIconName(index=103): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game104');
      logInfo(`${BUNDLE}ListIconName_0055 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0056
     * @tc.name      DragAndExchange_ListIconName_0056
     * @tc.desc      listIconName(index=-53) returns "drag_and_exchange_ic_public_game-52"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListIconName_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListIconName_0056 begin`);
      const actual: string = listIconName(-53);
      logInfo(`listIconName(index=-53): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game-52');
      logInfo(`${BUNDLE}ListIconName_0056 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0057
     * @tc.name      DragAndExchange_ListIconName_0057
     * @tc.desc      listIconName(index=118) returns "drag_and_exchange_ic_public_game119"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0057 begin`);
      const actual: string = listIconName(118);
      logInfo(`listIconName(index=118): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game119');
      logInfo(`${BUNDLE}ListIconName_0057 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0058
     * @tc.name      DragAndExchange_ListIconName_0058
     * @tc.desc      listIconName(index=149) returns "drag_and_exchange_ic_public_game150"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0058 begin`);
      const actual: string = listIconName(149);
      logInfo(`listIconName(index=149): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game150');
      logInfo(`${BUNDLE}ListIconName_0058 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0059
     * @tc.name      DragAndExchange_ListIconName_0059
     * @tc.desc      listIconName(index=166) returns "drag_and_exchange_ic_public_game167"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0059 begin`);
      const actual: string = listIconName(166);
      logInfo(`listIconName(index=166): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game167');
      logInfo(`${BUNDLE}ListIconName_0059 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0060
     * @tc.name      DragAndExchange_ListIconName_0060
     * @tc.desc      listIconName(index=74.28) returns "drag_and_exchange_ic_public_game75.28"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0060 begin`);
      const actual: string = listIconName(74.28);
      logInfo(`listIconName(index=74.28): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game75.28');
      logInfo(`${BUNDLE}ListIconName_0060 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0061
     * @tc.name      DragAndExchange_ListIconName_0061
     * @tc.desc      listIconName(index=121) returns "drag_and_exchange_ic_public_game122"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0061 begin`);
      const actual: string = listIconName(121);
      logInfo(`listIconName(index=121): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game122');
      logInfo(`${BUNDLE}ListIconName_0061 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0062
     * @tc.name      DragAndExchange_ListIconName_0062
     * @tc.desc      listIconName(index=57.53) returns "drag_and_exchange_ic_public_game58.53"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0062 begin`);
      const actual: string = listIconName(57.53);
      logInfo(`listIconName(index=57.53): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game58.53');
      logInfo(`${BUNDLE}ListIconName_0062 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0063
     * @tc.name      DragAndExchange_ListIconName_0063
     * @tc.desc      listIconName(index=19) returns "drag_and_exchange_ic_public_game20"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0063 begin`);
      const actual: string = listIconName(19);
      logInfo(`listIconName(index=19): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game20');
      logInfo(`${BUNDLE}ListIconName_0063 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0064
     * @tc.name      DragAndExchange_ListIconName_0064
     * @tc.desc      listIconName(index=151) returns "drag_and_exchange_ic_public_game152"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0064 begin`);
      const actual: string = listIconName(151);
      logInfo(`listIconName(index=151): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game152');
      logInfo(`${BUNDLE}ListIconName_0064 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0065
     * @tc.name      DragAndExchange_ListIconName_0065
     * @tc.desc      listIconName(index=21.91) returns "drag_and_exchange_ic_public_game22.91"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0065 begin`);
      const actual: string = listIconName(21.91);
      logInfo(`listIconName(index=21.91): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game22.91');
      logInfo(`${BUNDLE}ListIconName_0065 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0066
     * @tc.name      DragAndExchange_ListIconName_0066
     * @tc.desc      listIconName(index=177) returns "drag_and_exchange_ic_public_game178"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0066 begin`);
      const actual: string = listIconName(177);
      logInfo(`listIconName(index=177): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game178');
      logInfo(`${BUNDLE}ListIconName_0066 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0067
     * @tc.name      DragAndExchange_ListIconName_0067
     * @tc.desc      listIconName(index=26) returns "drag_and_exchange_ic_public_game27"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0067 begin`);
      const actual: string = listIconName(26);
      logInfo(`listIconName(index=26): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game27');
      logInfo(`${BUNDLE}ListIconName_0067 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0068
     * @tc.name      DragAndExchange_ListIconName_0068
     * @tc.desc      listIconName(index=99) returns "drag_and_exchange_ic_public_game100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0068 begin`);
      const actual: string = listIconName(99);
      logInfo(`listIconName(index=99): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game100');
      logInfo(`${BUNDLE}ListIconName_0068 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0069
     * @tc.name      DragAndExchange_ListIconName_0069
     * @tc.desc      listIconName(index=167) returns "drag_and_exchange_ic_public_game168"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0069 begin`);
      const actual: string = listIconName(167);
      logInfo(`listIconName(index=167): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game168');
      logInfo(`${BUNDLE}ListIconName_0069 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0070
     * @tc.name      DragAndExchange_ListIconName_0070
     * @tc.desc      listIconName(index=34.28) returns "drag_and_exchange_ic_public_game35.28"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0070 begin`);
      const actual: string = listIconName(34.28);
      logInfo(`listIconName(index=34.28): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game35.28');
      logInfo(`${BUNDLE}ListIconName_0070 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0071
     * @tc.name      DragAndExchange_ListIconName_0071
     * @tc.desc      listIconName(index=77) returns "drag_and_exchange_ic_public_game78"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0071 begin`);
      const actual: string = listIconName(77);
      logInfo(`listIconName(index=77): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game78');
      logInfo(`${BUNDLE}ListIconName_0071 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0072
     * @tc.name      DragAndExchange_ListIconName_0072
     * @tc.desc      listIconName(index=111) returns "drag_and_exchange_ic_public_game112"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0072 begin`);
      const actual: string = listIconName(111);
      logInfo(`listIconName(index=111): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game112');
      logInfo(`${BUNDLE}ListIconName_0072 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0073
     * @tc.name      DragAndExchange_ListIconName_0073
     * @tc.desc      listIconName(index=-32) returns "drag_and_exchange_ic_public_game-31"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListIconName_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListIconName_0073 begin`);
      const actual: string = listIconName(-32);
      logInfo(`listIconName(index=-32): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game-31');
      logInfo(`${BUNDLE}ListIconName_0073 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0074
     * @tc.name      DragAndExchange_ListIconName_0074
     * @tc.desc      listIconName(index=6.99) returns "drag_and_exchange_ic_public_game7.99"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0074 begin`);
      const actual: string = listIconName(6.99);
      logInfo(`listIconName(index=6.99): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game7.99');
      logInfo(`${BUNDLE}ListIconName_0074 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0075
     * @tc.name      DragAndExchange_ListIconName_0075
     * @tc.desc      listIconName(index=47) returns "drag_and_exchange_ic_public_game48"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0075 begin`);
      const actual: string = listIconName(47);
      logInfo(`listIconName(index=47): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game48');
      logInfo(`${BUNDLE}ListIconName_0075 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0076
     * @tc.name      DragAndExchange_ListIconName_0076
     * @tc.desc      listIconName(index=-93) returns "drag_and_exchange_ic_public_game-92"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListIconName_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListIconName_0076 begin`);
      const actual: string = listIconName(-93);
      logInfo(`listIconName(index=-93): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game-92');
      logInfo(`${BUNDLE}ListIconName_0076 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0077
     * @tc.name      DragAndExchange_ListIconName_0077
     * @tc.desc      listIconName(index=-8) returns "drag_and_exchange_ic_public_game-7"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListIconName_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListIconName_0077 begin`);
      const actual: string = listIconName(-8);
      logInfo(`listIconName(index=-8): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game-7');
      logInfo(`${BUNDLE}ListIconName_0077 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0078
     * @tc.name      DragAndExchange_ListIconName_0078
     * @tc.desc      listIconName(index=86) returns "drag_and_exchange_ic_public_game87"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0078 begin`);
      const actual: string = listIconName(86);
      logInfo(`listIconName(index=86): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game87');
      logInfo(`${BUNDLE}ListIconName_0078 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0079
     * @tc.name      DragAndExchange_ListIconName_0079
     * @tc.desc      listIconName(index=113) returns "drag_and_exchange_ic_public_game114"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0079 begin`);
      const actual: string = listIconName(113);
      logInfo(`listIconName(index=113): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game114');
      logInfo(`${BUNDLE}ListIconName_0079 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0080
     * @tc.name      DragAndExchange_ListIconName_0080
     * @tc.desc      listIconName(index=-11) returns "drag_and_exchange_ic_public_game-10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListIconName_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListIconName_0080 begin`);
      const actual: string = listIconName(-11);
      logInfo(`listIconName(index=-11): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game-10');
      logInfo(`${BUNDLE}ListIconName_0080 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0081
     * @tc.name      DragAndExchange_ListIconName_0081
     * @tc.desc      listIconName(index=-56) returns "drag_and_exchange_ic_public_game-55"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListIconName_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListIconName_0081 begin`);
      const actual: string = listIconName(-56);
      logInfo(`listIconName(index=-56): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game-55');
      logInfo(`${BUNDLE}ListIconName_0081 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0082
     * @tc.name      DragAndExchange_ListIconName_0082
     * @tc.desc      listIconName(index=84) returns "drag_and_exchange_ic_public_game85"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0082 begin`);
      const actual: string = listIconName(84);
      logInfo(`listIconName(index=84): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game85');
      logInfo(`${BUNDLE}ListIconName_0082 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0083
     * @tc.name      DragAndExchange_ListIconName_0083
     * @tc.desc      listIconName(index=57) returns "drag_and_exchange_ic_public_game58"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0083 begin`);
      const actual: string = listIconName(57);
      logInfo(`listIconName(index=57): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game58');
      logInfo(`${BUNDLE}ListIconName_0083 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0084
     * @tc.name      DragAndExchange_ListIconName_0084
     * @tc.desc      listIconName(index=143) returns "drag_and_exchange_ic_public_game144"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0084 begin`);
      const actual: string = listIconName(143);
      logInfo(`listIconName(index=143): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game144');
      logInfo(`${BUNDLE}ListIconName_0084 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0085
     * @tc.name      DragAndExchange_ListIconName_0085
     * @tc.desc      listIconName(index=79) returns "drag_and_exchange_ic_public_game80"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0085 begin`);
      const actual: string = listIconName(79);
      logInfo(`listIconName(index=79): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game80');
      logInfo(`${BUNDLE}ListIconName_0085 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0086
     * @tc.name      DragAndExchange_ListIconName_0086
     * @tc.desc      listIconName(index=-4) returns "drag_and_exchange_ic_public_game-3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListIconName_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListIconName_0086 begin`);
      const actual: string = listIconName(-4);
      logInfo(`listIconName(index=-4): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game-3');
      logInfo(`${BUNDLE}ListIconName_0086 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0087
     * @tc.name      DragAndExchange_ListIconName_0087
     * @tc.desc      listIconName(index=39) returns "drag_and_exchange_ic_public_game40"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0087 begin`);
      const actual: string = listIconName(39);
      logInfo(`listIconName(index=39): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game40');
      logInfo(`${BUNDLE}ListIconName_0087 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0088
     * @tc.name      DragAndExchange_ListIconName_0088
     * @tc.desc      listIconName(index=2.8) returns "drag_and_exchange_ic_public_game3.8"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0088 begin`);
      const actual: string = listIconName(2.8);
      logInfo(`listIconName(index=2.8): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game3.8');
      logInfo(`${BUNDLE}ListIconName_0088 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0089
     * @tc.name      DragAndExchange_ListIconName_0089
     * @tc.desc      listIconName(index=133) returns "drag_and_exchange_ic_public_game134"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0089 begin`);
      const actual: string = listIconName(133);
      logInfo(`listIconName(index=133): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game134');
      logInfo(`${BUNDLE}ListIconName_0089 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0090
     * @tc.name      DragAndExchange_ListIconName_0090
     * @tc.desc      listIconName(index=21.39) returns "drag_and_exchange_ic_public_game22.39"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0090 begin`);
      const actual: string = listIconName(21.39);
      logInfo(`listIconName(index=21.39): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game22.39');
      logInfo(`${BUNDLE}ListIconName_0090 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0091
     * @tc.name      DragAndExchange_ListIconName_0091
     * @tc.desc      listIconName(index=-70) returns "drag_and_exchange_ic_public_game-69"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListIconName_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListIconName_0091 begin`);
      const actual: string = listIconName(-70);
      logInfo(`listIconName(index=-70): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game-69');
      logInfo(`${BUNDLE}ListIconName_0091 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0092
     * @tc.name      DragAndExchange_ListIconName_0092
     * @tc.desc      listIconName(index=-73) returns "drag_and_exchange_ic_public_game-72"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListIconName_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListIconName_0092 begin`);
      const actual: string = listIconName(-73);
      logInfo(`listIconName(index=-73): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game-72');
      logInfo(`${BUNDLE}ListIconName_0092 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0093
     * @tc.name      DragAndExchange_ListIconName_0093
     * @tc.desc      listIconName(index=91.44) returns "drag_and_exchange_ic_public_game92.44"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0093 begin`);
      const actual: string = listIconName(91.44);
      logInfo(`listIconName(index=91.44): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game92.44');
      logInfo(`${BUNDLE}ListIconName_0093 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0094
     * @tc.name      DragAndExchange_ListIconName_0094
     * @tc.desc      listIconName(index=139) returns "drag_and_exchange_ic_public_game140"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0094 begin`);
      const actual: string = listIconName(139);
      logInfo(`listIconName(index=139): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game140');
      logInfo(`${BUNDLE}ListIconName_0094 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0095
     * @tc.name      DragAndExchange_ListIconName_0095
     * @tc.desc      listIconName(index=-3) returns "drag_and_exchange_ic_public_game-2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListIconName_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListIconName_0095 begin`);
      const actual: string = listIconName(-3);
      logInfo(`listIconName(index=-3): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game-2');
      logInfo(`${BUNDLE}ListIconName_0095 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0096
     * @tc.name      DragAndExchange_ListIconName_0096
     * @tc.desc      listIconName(index=36.89) returns "drag_and_exchange_ic_public_game37.89"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0096 begin`);
      const actual: string = listIconName(36.89);
      logInfo(`listIconName(index=36.89): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game37.89');
      logInfo(`${BUNDLE}ListIconName_0096 end`);
    });
  });
}
