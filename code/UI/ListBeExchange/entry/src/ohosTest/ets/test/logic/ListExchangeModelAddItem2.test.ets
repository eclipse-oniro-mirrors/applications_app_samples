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
import { ListExchangeModel } from '../model/ListExchangeLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ListBeExchange]';
const BUNDLE: string = 'ListBeExchange_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for ListExchangeModel.addItem (37 cases). */
export default function listExchangeModelAddItem2Test(): void {
  describe('ListExchangeModelAddItem2Test', (): void => {
    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_ADD_ITEM_0054
     * @tc.name      ListBeExchange_ListExchangeModelAddItem_0054
     * @tc.desc      ListExchangeModel.addItem(item="MQWnRLJ") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelAddItem_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0054 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.addItem('MQWnRLJ');
      logInfo(`addItem(item="MQWnRLJ"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`addItem(item="MQWnRLJ") state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem(item="MQWnRLJ") state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["MQWnRLJ"]');
      logInfo(`addItem(item="MQWnRLJ") state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem(item="MQWnRLJ") state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem(item="MQWnRLJ") state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem(item="MQWnRLJ") state: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0054 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_ADD_ITEM_0055
     * @tc.name      ListBeExchange_ListExchangeModelAddItem_0055
     * @tc.desc      ListExchangeModel.addItem(item="l1kt6") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelAddItem_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0055 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.addItem('l1kt6');
      logInfo(`addItem(item="l1kt6"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`addItem(item="l1kt6") state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem(item="l1kt6") state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["l1kt6"]');
      logInfo(`addItem(item="l1kt6") state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem(item="l1kt6") state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem(item="l1kt6") state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem(item="l1kt6") state: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0055 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_ADD_ITEM_0056
     * @tc.name      ListBeExchange_ListExchangeModelAddItem_0056
     * @tc.desc      ListExchangeModel.addItem(item="X") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelAddItem_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0056 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.addItem('X');
      logInfo(`addItem(item="X"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`addItem(item="X") state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem(item="X") state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["X"]');
      logInfo(`addItem(item="X") state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem(item="X") state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem(item="X") state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem(item="X") state: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0056 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_ADD_ITEM_0057
     * @tc.name      ListBeExchange_ListExchangeModelAddItem_0057
     * @tc.desc      ListExchangeModel.addItem(item="RDr4hJ") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelAddItem_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0057 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.addItem('RDr4hJ');
      logInfo(`addItem(item="RDr4hJ"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`addItem(item="RDr4hJ") state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem(item="RDr4hJ") state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["RDr4hJ"]');
      logInfo(`addItem(item="RDr4hJ") state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem(item="RDr4hJ") state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem(item="RDr4hJ") state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem(item="RDr4hJ") state: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0057 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_ADD_ITEM_0058
     * @tc.name      ListBeExchange_ListExchangeModelAddItem_0058
     * @tc.desc      ListExchangeModel.addItem(item="StxxnkW") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelAddItem_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0058 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.addItem('StxxnkW');
      logInfo(`addItem(item="StxxnkW"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`addItem(item="StxxnkW") state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem(item="StxxnkW") state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["StxxnkW"]');
      logInfo(`addItem(item="StxxnkW") state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem(item="StxxnkW") state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem(item="StxxnkW") state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem(item="StxxnkW") state: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0058 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_ADD_ITEM_0059
     * @tc.name      ListBeExchange_ListExchangeModelAddItem_0059
     * @tc.desc      ListExchangeModel.addItem(item="BMt") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelAddItem_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0059 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.addItem('BMt');
      logInfo(`addItem(item="BMt"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`addItem(item="BMt") state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem(item="BMt") state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["BMt"]');
      logInfo(`addItem(item="BMt") state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem(item="BMt") state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem(item="BMt") state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem(item="BMt") state: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0059 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_ADD_ITEM_0060
     * @tc.name      ListBeExchange_ListExchangeModelAddItem_0060
     * @tc.desc      ListExchangeModel.addItem(item="78v") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelAddItem_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0060 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.addItem('78v');
      logInfo(`addItem(item="78v"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`addItem(item="78v") state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem(item="78v") state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["78v"]');
      logInfo(`addItem(item="78v") state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem(item="78v") state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem(item="78v") state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem(item="78v") state: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0060 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_ADD_ITEM_0061
     * @tc.name      ListBeExchange_ListExchangeModelAddItem_0061
     * @tc.desc      ListExchangeModel.addItem(item="BKyLgmiJSF") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelAddItem_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0061 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.addItem('BKyLgmiJSF');
      logInfo(`addItem(item="BKyLgmiJSF"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`addItem(item="BKyLgmiJSF") state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem(item="BKyLgmiJSF") state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["BKyLgmiJSF"]');
      logInfo(`addItem(item="BKyLgmiJSF") state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem(item="BKyLgmiJSF") state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem(item="BKyLgmiJSF") state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem(item="BKyLgmiJSF") state: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0061 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_ADD_ITEM_0062
     * @tc.name      ListBeExchange_ListExchangeModelAddItem_0062
     * @tc.desc      ListExchangeModel.addItem(item="TQa") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelAddItem_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0062 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.addItem('TQa');
      logInfo(`addItem(item="TQa"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`addItem(item="TQa") state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem(item="TQa") state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["TQa"]');
      logInfo(`addItem(item="TQa") state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem(item="TQa") state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem(item="TQa") state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem(item="TQa") state: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0062 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_ADD_ITEM_0063
     * @tc.name      ListBeExchange_ListExchangeModelAddItem_0063
     * @tc.desc      ListExchangeModel.addItem(item="BiHJMrSoEO") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelAddItem_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0063 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.addItem('BiHJMrSoEO');
      logInfo(`addItem(item="BiHJMrSoEO"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`addItem(item="BiHJMrSoEO") state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem(item="BiHJMrSoEO") state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["BiHJMrSoEO"]');
      logInfo(`addItem(item="BiHJMrSoEO") state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem(item="BiHJMrSoEO") state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem(item="BiHJMrSoEO") state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem(item="BiHJMrSoEO") state: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0063 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_ADD_ITEM_0064
     * @tc.name      ListBeExchange_ListExchangeModelAddItem_0064
     * @tc.desc      ListExchangeModel.addItem(item="pS3O") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelAddItem_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0064 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.addItem('pS3O');
      logInfo(`addItem(item="pS3O"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`addItem(item="pS3O") state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem(item="pS3O") state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["pS3O"]');
      logInfo(`addItem(item="pS3O") state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem(item="pS3O") state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem(item="pS3O") state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem(item="pS3O") state: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0064 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_ADD_ITEM_0065
     * @tc.name      ListBeExchange_ListExchangeModelAddItem_0065
     * @tc.desc      ListExchangeModel.addItem(item="hrV79fhixpEg") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelAddItem_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0065 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.addItem('hrV79fhixpEg');
      logInfo(`addItem(item="hrV79fhixpEg"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`addItem(item="hrV79fhixpEg") state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem(item="hrV79fhixpEg") state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["hrV79fhixpEg"]');
      logInfo(`addItem(item="hrV79fhixpEg") state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem(item="hrV79fhixpEg") state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem(item="hrV79fhixpEg") state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem(item="hrV79fhixpEg") state: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0065 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_ADD_ITEM_0066
     * @tc.name      ListBeExchange_ListExchangeModelAddItem_0066
     * @tc.desc      ListExchangeModel.addItem(item="63") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelAddItem_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0066 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.addItem('63');
      logInfo(`addItem(item="63"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`addItem(item="63") state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem(item="63") state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["63"]');
      logInfo(`addItem(item="63") state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem(item="63") state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem(item="63") state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem(item="63") state: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0066 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_ADD_ITEM_0067
     * @tc.name      ListBeExchange_ListExchangeModelAddItem_0067
     * @tc.desc      ListExchangeModel.addItem(item="N80655AM") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelAddItem_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0067 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.addItem('N80655AM');
      logInfo(`addItem(item="N80655AM"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`addItem(item="N80655AM") state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem(item="N80655AM") state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["N80655AM"]');
      logInfo(`addItem(item="N80655AM") state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem(item="N80655AM") state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem(item="N80655AM") state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem(item="N80655AM") state: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0067 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_ADD_ITEM_0068
     * @tc.name      ListBeExchange_ListExchangeModelAddItem_0068
     * @tc.desc      ListExchangeModel.addItem(item="oDXZ2b") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelAddItem_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0068 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.addItem('oDXZ2b');
      logInfo(`addItem(item="oDXZ2b"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`addItem(item="oDXZ2b") state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem(item="oDXZ2b") state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["oDXZ2b"]');
      logInfo(`addItem(item="oDXZ2b") state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem(item="oDXZ2b") state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem(item="oDXZ2b") state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem(item="oDXZ2b") state: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0068 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_ADD_ITEM_0069
     * @tc.name      ListBeExchange_ListExchangeModelAddItem_0069
     * @tc.desc      ListExchangeModel.addItem(item="FikVYg0b") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelAddItem_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0069 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.addItem('FikVYg0b');
      logInfo(`addItem(item="FikVYg0b"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`addItem(item="FikVYg0b") state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem(item="FikVYg0b") state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["FikVYg0b"]');
      logInfo(`addItem(item="FikVYg0b") state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem(item="FikVYg0b") state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem(item="FikVYg0b") state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem(item="FikVYg0b") state: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0069 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_ADD_ITEM_0070
     * @tc.name      ListBeExchange_ListExchangeModelAddItem_0070
     * @tc.desc      ListExchangeModel.addItem(item="k") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelAddItem_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0070 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.addItem('k');
      logInfo(`addItem(item="k"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`addItem(item="k") state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem(item="k") state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["k"]');
      logInfo(`addItem(item="k") state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem(item="k") state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem(item="k") state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem(item="k") state: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0070 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_ADD_ITEM_0071
     * @tc.name      ListBeExchange_ListExchangeModelAddItem_0071
     * @tc.desc      ListExchangeModel.addItem(item="3tXMvdjLJk") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelAddItem_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0071 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.addItem('3tXMvdjLJk');
      logInfo(`addItem(item="3tXMvdjLJk"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`addItem(item="3tXMvdjLJk") state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem(item="3tXMvdjLJk") state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["3tXMvdjLJk"]');
      logInfo(`addItem(item="3tXMvdjLJk") state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem(item="3tXMvdjLJk") state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem(item="3tXMvdjLJk") state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem(item="3tXMvdjLJk") state: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0071 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_ADD_ITEM_0072
     * @tc.name      ListBeExchange_ListExchangeModelAddItem_0072
     * @tc.desc      ListExchangeModel.addItem(item="SjuHa") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelAddItem_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0072 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.addItem('SjuHa');
      logInfo(`addItem(item="SjuHa"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`addItem(item="SjuHa") state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem(item="SjuHa") state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["SjuHa"]');
      logInfo(`addItem(item="SjuHa") state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem(item="SjuHa") state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem(item="SjuHa") state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem(item="SjuHa") state: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0072 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_ADD_ITEM_0073
     * @tc.name      ListBeExchange_ListExchangeModelAddItem_0073
     * @tc.desc      ListExchangeModel.addItem(item="1IhCqhjG") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelAddItem_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0073 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.addItem('1IhCqhjG');
      logInfo(`addItem(item="1IhCqhjG"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`addItem(item="1IhCqhjG") state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem(item="1IhCqhjG") state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["1IhCqhjG"]');
      logInfo(`addItem(item="1IhCqhjG") state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem(item="1IhCqhjG") state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem(item="1IhCqhjG") state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem(item="1IhCqhjG") state: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0073 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_ADD_ITEM_0074
     * @tc.name      ListBeExchange_ListExchangeModelAddItem_0074
     * @tc.desc      ListExchangeModel.addItem(item="r1jcmzuOz") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelAddItem_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0074 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.addItem('r1jcmzuOz');
      logInfo(`addItem(item="r1jcmzuOz"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`addItem(item="r1jcmzuOz") state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem(item="r1jcmzuOz") state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["r1jcmzuOz"]');
      logInfo(`addItem(item="r1jcmzuOz") state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem(item="r1jcmzuOz") state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem(item="r1jcmzuOz") state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem(item="r1jcmzuOz") state: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0074 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_ADD_ITEM_0075
     * @tc.name      ListBeExchange_ListExchangeModelAddItem_0075
     * @tc.desc      ListExchangeModel.addItem(item="qTOP") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelAddItem_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0075 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.addItem('qTOP');
      logInfo(`addItem(item="qTOP"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`addItem(item="qTOP") state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem(item="qTOP") state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["qTOP"]');
      logInfo(`addItem(item="qTOP") state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem(item="qTOP") state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem(item="qTOP") state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem(item="qTOP") state: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0075 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_ADD_ITEM_0076
     * @tc.name      ListBeExchange_ListExchangeModelAddItem_0076
     * @tc.desc      ListExchangeModel.addItem(item="BvsqnlaDB") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelAddItem_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0076 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.addItem('BvsqnlaDB');
      logInfo(`addItem(item="BvsqnlaDB"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`addItem(item="BvsqnlaDB") state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem(item="BvsqnlaDB") state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["BvsqnlaDB"]');
      logInfo(`addItem(item="BvsqnlaDB") state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem(item="BvsqnlaDB") state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem(item="BvsqnlaDB") state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem(item="BvsqnlaDB") state: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0076 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_ADD_ITEM_0077
     * @tc.name      ListBeExchange_ListExchangeModelAddItem_0077
     * @tc.desc      ListExchangeModel.addItem(item="WjYH5IerXJG8") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelAddItem_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0077 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.addItem('WjYH5IerXJG8');
      logInfo(`addItem(item="WjYH5IerXJG8"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`addItem(item="WjYH5IerXJG8") state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem(item="WjYH5IerXJG8") state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["WjYH5IerXJG8"]');
      logInfo(`addItem(item="WjYH5IerXJG8") state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem(item="WjYH5IerXJG8") state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem(item="WjYH5IerXJG8") state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem(item="WjYH5IerXJG8") state: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0077 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_ADD_ITEM_0078
     * @tc.name      ListBeExchange_ListExchangeModelAddItem_0078
     * @tc.desc      ListExchangeModel.addItem(item="5") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelAddItem_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0078 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.addItem('5');
      logInfo(`addItem(item="5"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`addItem(item="5") state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem(item="5") state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["5"]');
      logInfo(`addItem(item="5") state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem(item="5") state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem(item="5") state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem(item="5") state: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0078 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_ADD_ITEM_0079
     * @tc.name      ListBeExchange_ListExchangeModelAddItem_0079
     * @tc.desc      ListExchangeModel.addItem(item="50jLkK") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelAddItem_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0079 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.addItem('50jLkK');
      logInfo(`addItem(item="50jLkK"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`addItem(item="50jLkK") state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem(item="50jLkK") state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["50jLkK"]');
      logInfo(`addItem(item="50jLkK") state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem(item="50jLkK") state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem(item="50jLkK") state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem(item="50jLkK") state: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0079 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_ADD_ITEM_0080
     * @tc.name      ListBeExchange_ListExchangeModelAddItem_0080
     * @tc.desc      ListExchangeModel.addItem(item="hfK") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelAddItem_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0080 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.addItem('hfK');
      logInfo(`addItem(item="hfK"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`addItem(item="hfK") state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem(item="hfK") state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["hfK"]');
      logInfo(`addItem(item="hfK") state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem(item="hfK") state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem(item="hfK") state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem(item="hfK") state: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0080 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_ADD_ITEM_0081
     * @tc.name      ListBeExchange_ListExchangeModelAddItem_0081
     * @tc.desc      ListExchangeModel.addItem(item="t") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelAddItem_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0081 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.addItem('t');
      logInfo(`addItem(item="t"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`addItem(item="t") state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem(item="t") state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["t"]');
      logInfo(`addItem(item="t") state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem(item="t") state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem(item="t") state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem(item="t") state: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0081 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_ADD_ITEM_0082
     * @tc.name      ListBeExchange_ListExchangeModelAddItem_0082
     * @tc.desc      ListExchangeModel.addItem(item="Se0FME75VqB") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelAddItem_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0082 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.addItem('Se0FME75VqB');
      logInfo(`addItem(item="Se0FME75VqB"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`addItem(item="Se0FME75VqB") state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem(item="Se0FME75VqB") state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["Se0FME75VqB"]');
      logInfo(`addItem(item="Se0FME75VqB") state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem(item="Se0FME75VqB") state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem(item="Se0FME75VqB") state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem(item="Se0FME75VqB") state: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0082 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_ADD_ITEM_0083
     * @tc.name      ListBeExchange_ListExchangeModelAddItem_0083
     * @tc.desc      ListExchangeModel.addItem(item="NMTTXzKFbJhD") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelAddItem_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0083 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.addItem('NMTTXzKFbJhD');
      logInfo(`addItem(item="NMTTXzKFbJhD"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`addItem(item="NMTTXzKFbJhD") state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem(item="NMTTXzKFbJhD") state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["NMTTXzKFbJhD"]');
      logInfo(`addItem(item="NMTTXzKFbJhD") state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem(item="NMTTXzKFbJhD") state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem(item="NMTTXzKFbJhD") state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem(item="NMTTXzKFbJhD") state: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0083 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_ADD_ITEM_0084
     * @tc.name      ListBeExchange_ListExchangeModelAddItem_0084
     * @tc.desc      ListExchangeModel.addItem(item="SBib") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelAddItem_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0084 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.addItem('SBib');
      logInfo(`addItem(item="SBib"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`addItem(item="SBib") state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem(item="SBib") state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["SBib"]');
      logInfo(`addItem(item="SBib") state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem(item="SBib") state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem(item="SBib") state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem(item="SBib") state: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0084 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_ADD_ITEM_0085
     * @tc.name      ListBeExchange_ListExchangeModelAddItem_0085
     * @tc.desc      ListExchangeModel.addItem(item="DcFIs") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelAddItem_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0085 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.addItem('DcFIs');
      logInfo(`addItem(item="DcFIs"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`addItem(item="DcFIs") state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem(item="DcFIs") state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["DcFIs"]');
      logInfo(`addItem(item="DcFIs") state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem(item="DcFIs") state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem(item="DcFIs") state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem(item="DcFIs") state: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0085 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_ADD_ITEM_0086
     * @tc.name      ListBeExchange_ListExchangeModelAddItem_0086
     * @tc.desc      ListExchangeModel.addItem(item="AfA7o3WDf") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelAddItem_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0086 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.addItem('AfA7o3WDf');
      logInfo(`addItem(item="AfA7o3WDf"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`addItem(item="AfA7o3WDf") state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem(item="AfA7o3WDf") state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["AfA7o3WDf"]');
      logInfo(`addItem(item="AfA7o3WDf") state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem(item="AfA7o3WDf") state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem(item="AfA7o3WDf") state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem(item="AfA7o3WDf") state: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0086 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_ADD_ITEM_0087
     * @tc.name      ListBeExchange_ListExchangeModelAddItem_0087
     * @tc.desc      ListExchangeModel.addItem(item="CDO2TN") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelAddItem_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0087 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.addItem('CDO2TN');
      logInfo(`addItem(item="CDO2TN"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`addItem(item="CDO2TN") state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem(item="CDO2TN") state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["CDO2TN"]');
      logInfo(`addItem(item="CDO2TN") state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem(item="CDO2TN") state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem(item="CDO2TN") state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem(item="CDO2TN") state: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0087 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_ADD_ITEM_0088
     * @tc.name      ListBeExchange_ListExchangeModelAddItem_0088
     * @tc.desc      ListExchangeModel.addItem(item="udhDji") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelAddItem_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0088 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.addItem('udhDji');
      logInfo(`addItem(item="udhDji"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`addItem(item="udhDji") state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem(item="udhDji") state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["udhDji"]');
      logInfo(`addItem(item="udhDji") state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem(item="udhDji") state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem(item="udhDji") state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem(item="udhDji") state: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0088 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_ADD_ITEM_0089
     * @tc.name      ListBeExchange_ListExchangeModelAddItem_0089
     * @tc.desc      ListExchangeModel.addItem(item="rGkBDyTDX") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelAddItem_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0089 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.addItem('rGkBDyTDX');
      logInfo(`addItem(item="rGkBDyTDX"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`addItem(item="rGkBDyTDX") state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem(item="rGkBDyTDX") state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["rGkBDyTDX"]');
      logInfo(`addItem(item="rGkBDyTDX") state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem(item="rGkBDyTDX") state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem(item="rGkBDyTDX") state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem(item="rGkBDyTDX") state: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0089 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_ADD_ITEM_0090
     * @tc.name      ListBeExchange_ListExchangeModelAddItem_0090
     * @tc.desc      ListExchangeModel.addItem(item="NYA7G") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelAddItem_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0090 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.addItem('NYA7G');
      logInfo(`addItem(item="NYA7G"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`addItem(item="NYA7G") state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem(item="NYA7G") state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["NYA7G"]');
      logInfo(`addItem(item="NYA7G") state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem(item="NYA7G") state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem(item="NYA7G") state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem(item="NYA7G") state: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0090 end`);
    });
  });
}
