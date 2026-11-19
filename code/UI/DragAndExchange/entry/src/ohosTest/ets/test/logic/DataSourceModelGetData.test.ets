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
import { DataSourceModel } from '../model/DragExchangeLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_DragAndExchange]';
const BUNDLE: string = 'DragAndExchange_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for DataSourceModel.getData (30 cases). */
export default function dataSourceModelGetDataTest(): void {
  describe('DataSourceModelGetDataTest', (): void => {
    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_GET_DATA_0001
     * @tc.name      DragAndExchange_DataSourceModelGetData_0001
     * @tc.desc      DataSourceModel.getData(index=0) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('DragAndExchange_DataSourceModelGetData_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}DataSourceModelGetData_0001 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const actual: string = subject.getData(0);
      logInfo(`getData(index=0): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}DataSourceModelGetData_0001 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_GET_DATA_0002
     * @tc.name      DragAndExchange_DataSourceModelGetData_0002
     * @tc.desc      DataSourceModel.getData(index=1) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('DragAndExchange_DataSourceModelGetData_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}DataSourceModelGetData_0002 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const actual: string = subject.getData(1);
      logInfo(`getData(index=1): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}DataSourceModelGetData_0002 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_GET_DATA_0003
     * @tc.name      DragAndExchange_DataSourceModelGetData_0003
     * @tc.desc      DataSourceModel.getData(index=-1) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_DataSourceModelGetData_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}DataSourceModelGetData_0003 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const actual: string = subject.getData(-1);
      logInfo(`getData(index=-1): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}DataSourceModelGetData_0003 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_GET_DATA_0004
     * @tc.name      DragAndExchange_DataSourceModelGetData_0004
     * @tc.desc      DataSourceModel.getData(index=2) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_DataSourceModelGetData_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}DataSourceModelGetData_0004 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const actual: string = subject.getData(2);
      logInfo(`getData(index=2): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}DataSourceModelGetData_0004 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_GET_DATA_0005
     * @tc.name      DragAndExchange_DataSourceModelGetData_0005
     * @tc.desc      DataSourceModel.getData(index=5) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelGetData_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelGetData_0005 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const actual: string = subject.getData(5);
      logInfo(`getData(index=5): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}DataSourceModelGetData_0005 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_GET_DATA_0006
     * @tc.name      DragAndExchange_DataSourceModelGetData_0006
     * @tc.desc      DataSourceModel.getData(index=10) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelGetData_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelGetData_0006 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const actual: string = subject.getData(10);
      logInfo(`getData(index=10): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}DataSourceModelGetData_0006 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_GET_DATA_0007
     * @tc.name      DragAndExchange_DataSourceModelGetData_0007
     * @tc.desc      DataSourceModel.getData(index=3) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelGetData_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelGetData_0007 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const actual: string = subject.getData(3);
      logInfo(`getData(index=3): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}DataSourceModelGetData_0007 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_GET_DATA_0008
     * @tc.name      DragAndExchange_DataSourceModelGetData_0008
     * @tc.desc      DataSourceModel.getData(index=100) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelGetData_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelGetData_0008 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const actual: string = subject.getData(100);
      logInfo(`getData(index=100): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}DataSourceModelGetData_0008 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_GET_DATA_0009
     * @tc.name      DragAndExchange_DataSourceModelGetData_0009
     * @tc.desc      DataSourceModel.getData(index=15) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelGetData_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelGetData_0009 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const actual: string = subject.getData(15);
      logInfo(`getData(index=15): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}DataSourceModelGetData_0009 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_GET_DATA_0010
     * @tc.name      DragAndExchange_DataSourceModelGetData_0010
     * @tc.desc      DataSourceModel.getData(index=20) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelGetData_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelGetData_0010 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const actual: string = subject.getData(20);
      logInfo(`getData(index=20): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}DataSourceModelGetData_0010 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_GET_DATA_0011
     * @tc.name      DragAndExchange_DataSourceModelGetData_0011
     * @tc.desc      DataSourceModel.getData(index=25) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelGetData_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelGetData_0011 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const actual: string = subject.getData(25);
      logInfo(`getData(index=25): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}DataSourceModelGetData_0011 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_GET_DATA_0012
     * @tc.name      DragAndExchange_DataSourceModelGetData_0012
     * @tc.desc      DataSourceModel.getData(index=30) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelGetData_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelGetData_0012 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const actual: string = subject.getData(30);
      logInfo(`getData(index=30): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}DataSourceModelGetData_0012 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_GET_DATA_0013
     * @tc.name      DragAndExchange_DataSourceModelGetData_0013
     * @tc.desc      DataSourceModel.getData(index=35) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelGetData_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelGetData_0013 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const actual: string = subject.getData(35);
      logInfo(`getData(index=35): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}DataSourceModelGetData_0013 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_GET_DATA_0014
     * @tc.name      DragAndExchange_DataSourceModelGetData_0014
     * @tc.desc      DataSourceModel.getData(index=40) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelGetData_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelGetData_0014 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const actual: string = subject.getData(40);
      logInfo(`getData(index=40): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}DataSourceModelGetData_0014 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_GET_DATA_0015
     * @tc.name      DragAndExchange_DataSourceModelGetData_0015
     * @tc.desc      DataSourceModel.getData(index=45) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelGetData_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelGetData_0015 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const actual: string = subject.getData(45);
      logInfo(`getData(index=45): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}DataSourceModelGetData_0015 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_GET_DATA_0016
     * @tc.name      DragAndExchange_DataSourceModelGetData_0016
     * @tc.desc      DataSourceModel.getData(index=50) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelGetData_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelGetData_0016 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const actual: string = subject.getData(50);
      logInfo(`getData(index=50): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}DataSourceModelGetData_0016 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_GET_DATA_0017
     * @tc.name      DragAndExchange_DataSourceModelGetData_0017
     * @tc.desc      DataSourceModel.getData(index=55) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelGetData_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelGetData_0017 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const actual: string = subject.getData(55);
      logInfo(`getData(index=55): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}DataSourceModelGetData_0017 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_GET_DATA_0018
     * @tc.name      DragAndExchange_DataSourceModelGetData_0018
     * @tc.desc      DataSourceModel.getData(index=60) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelGetData_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelGetData_0018 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const actual: string = subject.getData(60);
      logInfo(`getData(index=60): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}DataSourceModelGetData_0018 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_GET_DATA_0019
     * @tc.name      DragAndExchange_DataSourceModelGetData_0019
     * @tc.desc      DataSourceModel.getData(index=65) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelGetData_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelGetData_0019 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const actual: string = subject.getData(65);
      logInfo(`getData(index=65): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}DataSourceModelGetData_0019 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_GET_DATA_0020
     * @tc.name      DragAndExchange_DataSourceModelGetData_0020
     * @tc.desc      DataSourceModel.getData(index=70) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelGetData_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelGetData_0020 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const actual: string = subject.getData(70);
      logInfo(`getData(index=70): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}DataSourceModelGetData_0020 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_GET_DATA_0021
     * @tc.name      DragAndExchange_DataSourceModelGetData_0021
     * @tc.desc      DataSourceModel.getData(index=75) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelGetData_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelGetData_0021 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const actual: string = subject.getData(75);
      logInfo(`getData(index=75): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}DataSourceModelGetData_0021 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_GET_DATA_0022
     * @tc.name      DragAndExchange_DataSourceModelGetData_0022
     * @tc.desc      DataSourceModel.getData(index=80) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelGetData_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelGetData_0022 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const actual: string = subject.getData(80);
      logInfo(`getData(index=80): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}DataSourceModelGetData_0022 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_GET_DATA_0023
     * @tc.name      DragAndExchange_DataSourceModelGetData_0023
     * @tc.desc      DataSourceModel.getData(index=85) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelGetData_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelGetData_0023 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const actual: string = subject.getData(85);
      logInfo(`getData(index=85): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}DataSourceModelGetData_0023 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_GET_DATA_0024
     * @tc.name      DragAndExchange_DataSourceModelGetData_0024
     * @tc.desc      DataSourceModel.getData(index=90) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelGetData_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelGetData_0024 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const actual: string = subject.getData(90);
      logInfo(`getData(index=90): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}DataSourceModelGetData_0024 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_GET_DATA_0025
     * @tc.name      DragAndExchange_DataSourceModelGetData_0025
     * @tc.desc      DataSourceModel.getData(index=95) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelGetData_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelGetData_0025 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const actual: string = subject.getData(95);
      logInfo(`getData(index=95): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}DataSourceModelGetData_0025 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_GET_DATA_0026
     * @tc.name      DragAndExchange_DataSourceModelGetData_0026
     * @tc.desc      DataSourceModel.getData(index=105) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelGetData_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelGetData_0026 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const actual: string = subject.getData(105);
      logInfo(`getData(index=105): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}DataSourceModelGetData_0026 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_GET_DATA_0027
     * @tc.name      DragAndExchange_DataSourceModelGetData_0027
     * @tc.desc      DataSourceModel.getData(index=110) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelGetData_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelGetData_0027 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const actual: string = subject.getData(110);
      logInfo(`getData(index=110): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}DataSourceModelGetData_0027 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_GET_DATA_0028
     * @tc.name      DragAndExchange_DataSourceModelGetData_0028
     * @tc.desc      DataSourceModel.getData(index=115) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelGetData_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelGetData_0028 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const actual: string = subject.getData(115);
      logInfo(`getData(index=115): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}DataSourceModelGetData_0028 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_GET_DATA_0029
     * @tc.name      DragAndExchange_DataSourceModelGetData_0029
     * @tc.desc      DataSourceModel.getData(index=120) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelGetData_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelGetData_0029 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const actual: string = subject.getData(120);
      logInfo(`getData(index=120): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}DataSourceModelGetData_0029 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_GET_DATA_0030
     * @tc.name      DragAndExchange_DataSourceModelGetData_0030
     * @tc.desc      DataSourceModel.getData(index=125) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelGetData_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelGetData_0030 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const actual: string = subject.getData(125);
      logInfo(`getData(index=125): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}DataSourceModelGetData_0030 end`);
    });
  });
}
