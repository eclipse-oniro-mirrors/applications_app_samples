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

/** Logic checks for ListExchangeModel.drop (30 cases). */
export default function listExchangeModelDropTest(): void {
  describe('ListExchangeModelDropTest', (): void => {
    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_DROP_0001
     * @tc.name      ListBeExchange_ListExchangeModelDrop_0001
     * @tc.desc      ListExchangeModel.drop(item="") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ListBeExchange_ListExchangeModelDrop_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelDrop_0001 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.drop('');
      logInfo(`drop(item=""): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListExchangeModelDrop_0001 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_DROP_0002
     * @tc.name      ListBeExchange_ListExchangeModelDrop_0002
     * @tc.desc      ListExchangeModel.drop(item="a") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ListBeExchange_ListExchangeModelDrop_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelDrop_0002 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.drop('a');
      logInfo(`drop(item="a"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListExchangeModelDrop_0002 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_DROP_0003
     * @tc.name      ListBeExchange_ListExchangeModelDrop_0003
     * @tc.desc      ListExchangeModel.drop(item="abc") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelDrop_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelDrop_0003 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.drop('abc');
      logInfo(`drop(item="abc"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListExchangeModelDrop_0003 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_DROP_0004
     * @tc.name      ListBeExchange_ListExchangeModelDrop_0004
     * @tc.desc      ListExchangeModel.drop(item="Hello World") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelDrop_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelDrop_0004 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.drop('Hello World');
      logInfo(`drop(item="Hello World"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListExchangeModelDrop_0004 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_DROP_0005
     * @tc.name      ListBeExchange_ListExchangeModelDrop_0005
     * @tc.desc      ListExchangeModel.drop(item=" ") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelDrop_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelDrop_0005 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.drop(' ');
      logInfo(`drop(item=" "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListExchangeModelDrop_0005 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_DROP_0006
     * @tc.name      ListBeExchange_ListExchangeModelDrop_0006
     * @tc.desc      ListExchangeModel.drop(item="123") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelDrop_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelDrop_0006 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.drop('123');
      logInfo(`drop(item="123"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListExchangeModelDrop_0006 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_DROP_0007
     * @tc.name      ListBeExchange_ListExchangeModelDrop_0007
     * @tc.desc      ListExchangeModel.drop(item=" a ") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_ListExchangeModelDrop_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelDrop_0007 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.drop(' a ');
      logInfo(`drop(item=" a "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListExchangeModelDrop_0007 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_DROP_0008
     * @tc.name      ListBeExchange_ListExchangeModelDrop_0008
     * @tc.desc      ListExchangeModel.drop(item="aa") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelDrop_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelDrop_0008 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.drop('aa');
      logInfo(`drop(item="aa"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListExchangeModelDrop_0008 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_DROP_0009
     * @tc.name      ListBeExchange_ListExchangeModelDrop_0009
     * @tc.desc      ListExchangeModel.drop(item="a_1") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelDrop_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelDrop_0009 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.drop('a_1');
      logInfo(`drop(item="a_1"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListExchangeModelDrop_0009 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_DROP_0010
     * @tc.name      ListBeExchange_ListExchangeModelDrop_0010
     * @tc.desc      ListExchangeModel.drop(item="xa") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_ListExchangeModelDrop_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelDrop_0010 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.drop('xa');
      logInfo(`drop(item="xa"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListExchangeModelDrop_0010 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_DROP_0011
     * @tc.name      ListBeExchange_ListExchangeModelDrop_0011
     * @tc.desc      ListExchangeModel.drop(item=" abc ") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_ListExchangeModelDrop_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelDrop_0011 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.drop(' abc ');
      logInfo(`drop(item=" abc "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListExchangeModelDrop_0011 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_DROP_0012
     * @tc.name      ListBeExchange_ListExchangeModelDrop_0012
     * @tc.desc      ListExchangeModel.drop(item="abcabc") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelDrop_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelDrop_0012 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.drop('abcabc');
      logInfo(`drop(item="abcabc"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListExchangeModelDrop_0012 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_DROP_0013
     * @tc.name      ListBeExchange_ListExchangeModelDrop_0013
     * @tc.desc      ListExchangeModel.drop(item="abc_1") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelDrop_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelDrop_0013 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.drop('abc_1');
      logInfo(`drop(item="abc_1"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListExchangeModelDrop_0013 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_DROP_0014
     * @tc.name      ListBeExchange_ListExchangeModelDrop_0014
     * @tc.desc      ListExchangeModel.drop(item="xabc") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_ListExchangeModelDrop_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelDrop_0014 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.drop('xabc');
      logInfo(`drop(item="xabc"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListExchangeModelDrop_0014 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_DROP_0015
     * @tc.name      ListBeExchange_ListExchangeModelDrop_0015
     * @tc.desc      ListExchangeModel.drop(item=" Hello World ") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_ListExchangeModelDrop_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelDrop_0015 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.drop(' Hello World ');
      logInfo(`drop(item=" Hello World "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListExchangeModelDrop_0015 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_DROP_0016
     * @tc.name      ListBeExchange_ListExchangeModelDrop_0016
     * @tc.desc      ListExchangeModel.drop(item="Hello WorldHello World") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelDrop_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelDrop_0016 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.drop('Hello WorldHello World');
      logInfo(`drop(item="Hello WorldHello World"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListExchangeModelDrop_0016 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_DROP_0017
     * @tc.name      ListBeExchange_ListExchangeModelDrop_0017
     * @tc.desc      ListExchangeModel.drop(item="Hello World_1") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelDrop_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelDrop_0017 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.drop('Hello World_1');
      logInfo(`drop(item="Hello World_1"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListExchangeModelDrop_0017 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_DROP_0018
     * @tc.name      ListBeExchange_ListExchangeModelDrop_0018
     * @tc.desc      ListExchangeModel.drop(item="xHello World") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_ListExchangeModelDrop_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelDrop_0018 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.drop('xHello World');
      logInfo(`drop(item="xHello World"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListExchangeModelDrop_0018 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_DROP_0019
     * @tc.name      ListBeExchange_ListExchangeModelDrop_0019
     * @tc.desc      ListExchangeModel.drop(item="   ") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_ListExchangeModelDrop_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelDrop_0019 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.drop('   ');
      logInfo(`drop(item="   "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListExchangeModelDrop_0019 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_DROP_0020
     * @tc.name      ListBeExchange_ListExchangeModelDrop_0020
     * @tc.desc      ListExchangeModel.drop(item="  ") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelDrop_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelDrop_0020 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.drop('  ');
      logInfo(`drop(item="  "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListExchangeModelDrop_0020 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_DROP_0021
     * @tc.name      ListBeExchange_ListExchangeModelDrop_0021
     * @tc.desc      ListExchangeModel.drop(item=" _1") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelDrop_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelDrop_0021 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.drop(' _1');
      logInfo(`drop(item=" _1"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListExchangeModelDrop_0021 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_DROP_0022
     * @tc.name      ListBeExchange_ListExchangeModelDrop_0022
     * @tc.desc      ListExchangeModel.drop(item="x ") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_ListExchangeModelDrop_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelDrop_0022 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.drop('x ');
      logInfo(`drop(item="x "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListExchangeModelDrop_0022 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_DROP_0023
     * @tc.name      ListBeExchange_ListExchangeModelDrop_0023
     * @tc.desc      ListExchangeModel.drop(item=" 123 ") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_ListExchangeModelDrop_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelDrop_0023 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.drop(' 123 ');
      logInfo(`drop(item=" 123 "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListExchangeModelDrop_0023 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_DROP_0024
     * @tc.name      ListBeExchange_ListExchangeModelDrop_0024
     * @tc.desc      ListExchangeModel.drop(item="123123") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelDrop_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelDrop_0024 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.drop('123123');
      logInfo(`drop(item="123123"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListExchangeModelDrop_0024 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_DROP_0025
     * @tc.name      ListBeExchange_ListExchangeModelDrop_0025
     * @tc.desc      ListExchangeModel.drop(item="123_1") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelDrop_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelDrop_0025 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.drop('123_1');
      logInfo(`drop(item="123_1"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListExchangeModelDrop_0025 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_DROP_0026
     * @tc.name      ListBeExchange_ListExchangeModelDrop_0026
     * @tc.desc      ListExchangeModel.drop(item="x123") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_ListExchangeModelDrop_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelDrop_0026 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.drop('x123');
      logInfo(`drop(item="x123"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListExchangeModelDrop_0026 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_DROP_0027
     * @tc.name      ListBeExchange_ListExchangeModelDrop_0027
     * @tc.desc      ListExchangeModel.drop(item="EdwApd") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelDrop_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelDrop_0027 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.drop('EdwApd');
      logInfo(`drop(item="EdwApd"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListExchangeModelDrop_0027 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_DROP_0028
     * @tc.name      ListBeExchange_ListExchangeModelDrop_0028
     * @tc.desc      ListExchangeModel.drop(item="kk5qlH") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelDrop_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelDrop_0028 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.drop('kk5qlH');
      logInfo(`drop(item="kk5qlH"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListExchangeModelDrop_0028 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_DROP_0029
     * @tc.name      ListBeExchange_ListExchangeModelDrop_0029
     * @tc.desc      ListExchangeModel.drop(item="J") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelDrop_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelDrop_0029 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.drop('J');
      logInfo(`drop(item="J"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListExchangeModelDrop_0029 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_DROP_0030
     * @tc.name      ListBeExchange_ListExchangeModelDrop_0030
     * @tc.desc      ListExchangeModel.drop(item="qTFvf") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelDrop_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelDrop_0030 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.drop('qTFvf');
      logInfo(`drop(item="qTFvf"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListExchangeModelDrop_0030 end`);
    });
  });
}
