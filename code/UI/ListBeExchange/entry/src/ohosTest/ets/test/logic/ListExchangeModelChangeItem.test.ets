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

/** Logic checks for ListExchangeModel.changeItem (30 cases). */
export default function listExchangeModelChangeItemTest(): void {
  describe('ListExchangeModelChangeItemTest', (): void => {
    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_CHANGE_ITEM_0001
     * @tc.name      ListBeExchange_ListExchangeModelChangeItem_0001
     * @tc.desc      ListExchangeModel.changeItem(index=0, newIndex=0) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ListBeExchange_ListExchangeModelChangeItem_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelChangeItem_0001 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      subject.changeItem(0, 0);
      logInfo(`changeItem(index=0, newIndex=0) state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`changeItem(index=0, newIndex=0) state: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertUndefined();
      logInfo(`changeItem(index=0, newIndex=0) state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`changeItem(index=0, newIndex=0) state: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertUndefined();
      logInfo(`changeItem(index=0, newIndex=0) state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`changeItem(index=0, newIndex=0) state: subject.offsets[0]=${subject.offsets[0]}`);
      expect(subject.offsets[0]).assertUndefined();
      logInfo(`${BUNDLE}ListExchangeModelChangeItem_0001 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_CHANGE_ITEM_0002
     * @tc.name      ListBeExchange_ListExchangeModelChangeItem_0002
     * @tc.desc      ListExchangeModel.changeItem(index=0, newIndex=1) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ListBeExchange_ListExchangeModelChangeItem_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelChangeItem_0002 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      subject.changeItem(0, 1);
      logInfo(`changeItem(index=0, newIndex=1) state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`changeItem(index=0, newIndex=1) state: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertUndefined();
      logInfo(`changeItem(index=0, newIndex=1) state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`changeItem(index=0, newIndex=1) state: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertUndefined();
      logInfo(`changeItem(index=0, newIndex=1) state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`changeItem(index=0, newIndex=1) state: subject.offsets[0]=${subject.offsets[0]}`);
      expect(subject.offsets[0]).assertUndefined();
      logInfo(`${BUNDLE}ListExchangeModelChangeItem_0002 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_CHANGE_ITEM_0003
     * @tc.name      ListBeExchange_ListExchangeModelChangeItem_0003
     * @tc.desc      ListExchangeModel.changeItem(index=0, newIndex=2) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_ListExchangeModelChangeItem_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelChangeItem_0003 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      subject.changeItem(0, 2);
      logInfo(`changeItem(index=0, newIndex=2) state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`changeItem(index=0, newIndex=2) state: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertUndefined();
      logInfo(`changeItem(index=0, newIndex=2) state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`changeItem(index=0, newIndex=2) state: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertUndefined();
      logInfo(`changeItem(index=0, newIndex=2) state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`changeItem(index=0, newIndex=2) state: subject.offsets[0]=${subject.offsets[0]}`);
      expect(subject.offsets[0]).assertUndefined();
      logInfo(`${BUNDLE}ListExchangeModelChangeItem_0003 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_CHANGE_ITEM_0004
     * @tc.name      ListBeExchange_ListExchangeModelChangeItem_0004
     * @tc.desc      ListExchangeModel.changeItem(index=0, newIndex=-1) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_ListExchangeModelChangeItem_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelChangeItem_0004 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      subject.changeItem(0, -1);
      logInfo(`changeItem(index=0, newIndex=-1) state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`changeItem(index=0, newIndex=-1) state: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertUndefined();
      logInfo(`changeItem(index=0, newIndex=-1) state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`changeItem(index=0, newIndex=-1) state: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertUndefined();
      logInfo(`changeItem(index=0, newIndex=-1) state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`changeItem(index=0, newIndex=-1) state: subject.offsets[0]=${subject.offsets[0]}`);
      expect(subject.offsets[0]).assertUndefined();
      logInfo(`${BUNDLE}ListExchangeModelChangeItem_0004 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_CHANGE_ITEM_0005
     * @tc.name      ListBeExchange_ListExchangeModelChangeItem_0005
     * @tc.desc      ListExchangeModel.changeItem(index=0, newIndex=-2) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_ListExchangeModelChangeItem_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelChangeItem_0005 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      subject.changeItem(0, -2);
      logInfo(`changeItem(index=0, newIndex=-2) state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`changeItem(index=0, newIndex=-2) state: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertUndefined();
      logInfo(`changeItem(index=0, newIndex=-2) state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`changeItem(index=0, newIndex=-2) state: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertUndefined();
      logInfo(`changeItem(index=0, newIndex=-2) state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`changeItem(index=0, newIndex=-2) state: subject.offsets[0]=${subject.offsets[0]}`);
      expect(subject.offsets[0]).assertUndefined();
      logInfo(`${BUNDLE}ListExchangeModelChangeItem_0005 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_CHANGE_ITEM_0006
     * @tc.name      ListBeExchange_ListExchangeModelChangeItem_0006
     * @tc.desc      ListExchangeModel.changeItem(index=0, newIndex=5) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelChangeItem_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelChangeItem_0006 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      subject.changeItem(0, 5);
      logInfo(`changeItem(index=0, newIndex=5) state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`changeItem(index=0, newIndex=5) state: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertUndefined();
      logInfo(`changeItem(index=0, newIndex=5) state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`changeItem(index=0, newIndex=5) state: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertUndefined();
      logInfo(`changeItem(index=0, newIndex=5) state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`changeItem(index=0, newIndex=5) state: subject.offsets[0]=${subject.offsets[0]}`);
      expect(subject.offsets[0]).assertUndefined();
      logInfo(`${BUNDLE}ListExchangeModelChangeItem_0006 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_CHANGE_ITEM_0007
     * @tc.name      ListBeExchange_ListExchangeModelChangeItem_0007
     * @tc.desc      ListExchangeModel.changeItem(index=0, newIndex=10) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelChangeItem_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelChangeItem_0007 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      subject.changeItem(0, 10);
      logInfo(`changeItem(index=0, newIndex=10) state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`changeItem(index=0, newIndex=10) state: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertUndefined();
      logInfo(`changeItem(index=0, newIndex=10) state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`changeItem(index=0, newIndex=10) state: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertUndefined();
      logInfo(`changeItem(index=0, newIndex=10) state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`changeItem(index=0, newIndex=10) state: subject.offsets[0]=${subject.offsets[0]}`);
      expect(subject.offsets[0]).assertUndefined();
      logInfo(`${BUNDLE}ListExchangeModelChangeItem_0007 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_CHANGE_ITEM_0008
     * @tc.name      ListBeExchange_ListExchangeModelChangeItem_0008
     * @tc.desc      ListExchangeModel.changeItem(index=0, newIndex=3) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelChangeItem_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelChangeItem_0008 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      subject.changeItem(0, 3);
      logInfo(`changeItem(index=0, newIndex=3) state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`changeItem(index=0, newIndex=3) state: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertUndefined();
      logInfo(`changeItem(index=0, newIndex=3) state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`changeItem(index=0, newIndex=3) state: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertUndefined();
      logInfo(`changeItem(index=0, newIndex=3) state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`changeItem(index=0, newIndex=3) state: subject.offsets[0]=${subject.offsets[0]}`);
      expect(subject.offsets[0]).assertUndefined();
      logInfo(`${BUNDLE}ListExchangeModelChangeItem_0008 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_CHANGE_ITEM_0009
     * @tc.name      ListBeExchange_ListExchangeModelChangeItem_0009
     * @tc.desc      ListExchangeModel.changeItem(index=0, newIndex=100) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelChangeItem_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelChangeItem_0009 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      subject.changeItem(0, 100);
      logInfo(`changeItem(index=0, newIndex=100) state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`changeItem(index=0, newIndex=100) state: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertUndefined();
      logInfo(`changeItem(index=0, newIndex=100) state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`changeItem(index=0, newIndex=100) state: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertUndefined();
      logInfo(`changeItem(index=0, newIndex=100) state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`changeItem(index=0, newIndex=100) state: subject.offsets[0]=${subject.offsets[0]}`);
      expect(subject.offsets[0]).assertUndefined();
      logInfo(`${BUNDLE}ListExchangeModelChangeItem_0009 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_CHANGE_ITEM_0010
     * @tc.name      ListBeExchange_ListExchangeModelChangeItem_0010
     * @tc.desc      ListExchangeModel.changeItem(index=0, newIndex=15) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelChangeItem_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelChangeItem_0010 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      subject.changeItem(0, 15);
      logInfo(`changeItem(index=0, newIndex=15) state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`changeItem(index=0, newIndex=15) state: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertUndefined();
      logInfo(`changeItem(index=0, newIndex=15) state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`changeItem(index=0, newIndex=15) state: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertUndefined();
      logInfo(`changeItem(index=0, newIndex=15) state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`changeItem(index=0, newIndex=15) state: subject.offsets[0]=${subject.offsets[0]}`);
      expect(subject.offsets[0]).assertUndefined();
      logInfo(`${BUNDLE}ListExchangeModelChangeItem_0010 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_CHANGE_ITEM_0011
     * @tc.name      ListBeExchange_ListExchangeModelChangeItem_0011
     * @tc.desc      ListExchangeModel.changeItem(index=0, newIndex=20) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelChangeItem_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelChangeItem_0011 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      subject.changeItem(0, 20);
      logInfo(`changeItem(index=0, newIndex=20) state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`changeItem(index=0, newIndex=20) state: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertUndefined();
      logInfo(`changeItem(index=0, newIndex=20) state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`changeItem(index=0, newIndex=20) state: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertUndefined();
      logInfo(`changeItem(index=0, newIndex=20) state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`changeItem(index=0, newIndex=20) state: subject.offsets[0]=${subject.offsets[0]}`);
      expect(subject.offsets[0]).assertUndefined();
      logInfo(`${BUNDLE}ListExchangeModelChangeItem_0011 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_CHANGE_ITEM_0012
     * @tc.name      ListBeExchange_ListExchangeModelChangeItem_0012
     * @tc.desc      ListExchangeModel.changeItem(index=0, newIndex=25) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelChangeItem_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelChangeItem_0012 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      subject.changeItem(0, 25);
      logInfo(`changeItem(index=0, newIndex=25) state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`changeItem(index=0, newIndex=25) state: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertUndefined();
      logInfo(`changeItem(index=0, newIndex=25) state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`changeItem(index=0, newIndex=25) state: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertUndefined();
      logInfo(`changeItem(index=0, newIndex=25) state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`changeItem(index=0, newIndex=25) state: subject.offsets[0]=${subject.offsets[0]}`);
      expect(subject.offsets[0]).assertUndefined();
      logInfo(`${BUNDLE}ListExchangeModelChangeItem_0012 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_CHANGE_ITEM_0013
     * @tc.name      ListBeExchange_ListExchangeModelChangeItem_0013
     * @tc.desc      ListExchangeModel.changeItem(index=0, newIndex=30) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelChangeItem_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelChangeItem_0013 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      subject.changeItem(0, 30);
      logInfo(`changeItem(index=0, newIndex=30) state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`changeItem(index=0, newIndex=30) state: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertUndefined();
      logInfo(`changeItem(index=0, newIndex=30) state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`changeItem(index=0, newIndex=30) state: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertUndefined();
      logInfo(`changeItem(index=0, newIndex=30) state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`changeItem(index=0, newIndex=30) state: subject.offsets[0]=${subject.offsets[0]}`);
      expect(subject.offsets[0]).assertUndefined();
      logInfo(`${BUNDLE}ListExchangeModelChangeItem_0013 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_CHANGE_ITEM_0014
     * @tc.name      ListBeExchange_ListExchangeModelChangeItem_0014
     * @tc.desc      ListExchangeModel.changeItem(index=0, newIndex=35) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelChangeItem_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelChangeItem_0014 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      subject.changeItem(0, 35);
      logInfo(`changeItem(index=0, newIndex=35) state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`changeItem(index=0, newIndex=35) state: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertUndefined();
      logInfo(`changeItem(index=0, newIndex=35) state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`changeItem(index=0, newIndex=35) state: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertUndefined();
      logInfo(`changeItem(index=0, newIndex=35) state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`changeItem(index=0, newIndex=35) state: subject.offsets[0]=${subject.offsets[0]}`);
      expect(subject.offsets[0]).assertUndefined();
      logInfo(`${BUNDLE}ListExchangeModelChangeItem_0014 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_CHANGE_ITEM_0015
     * @tc.name      ListBeExchange_ListExchangeModelChangeItem_0015
     * @tc.desc      ListExchangeModel.changeItem(index=0, newIndex=40) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelChangeItem_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelChangeItem_0015 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      subject.changeItem(0, 40);
      logInfo(`changeItem(index=0, newIndex=40) state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`changeItem(index=0, newIndex=40) state: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertUndefined();
      logInfo(`changeItem(index=0, newIndex=40) state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`changeItem(index=0, newIndex=40) state: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertUndefined();
      logInfo(`changeItem(index=0, newIndex=40) state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`changeItem(index=0, newIndex=40) state: subject.offsets[0]=${subject.offsets[0]}`);
      expect(subject.offsets[0]).assertUndefined();
      logInfo(`${BUNDLE}ListExchangeModelChangeItem_0015 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_CHANGE_ITEM_0016
     * @tc.name      ListBeExchange_ListExchangeModelChangeItem_0016
     * @tc.desc      ListExchangeModel.changeItem(index=0, newIndex=45) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelChangeItem_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelChangeItem_0016 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      subject.changeItem(0, 45);
      logInfo(`changeItem(index=0, newIndex=45) state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`changeItem(index=0, newIndex=45) state: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertUndefined();
      logInfo(`changeItem(index=0, newIndex=45) state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`changeItem(index=0, newIndex=45) state: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertUndefined();
      logInfo(`changeItem(index=0, newIndex=45) state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`changeItem(index=0, newIndex=45) state: subject.offsets[0]=${subject.offsets[0]}`);
      expect(subject.offsets[0]).assertUndefined();
      logInfo(`${BUNDLE}ListExchangeModelChangeItem_0016 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_CHANGE_ITEM_0017
     * @tc.name      ListBeExchange_ListExchangeModelChangeItem_0017
     * @tc.desc      ListExchangeModel.changeItem(index=0, newIndex=50) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelChangeItem_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelChangeItem_0017 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      subject.changeItem(0, 50);
      logInfo(`changeItem(index=0, newIndex=50) state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`changeItem(index=0, newIndex=50) state: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertUndefined();
      logInfo(`changeItem(index=0, newIndex=50) state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`changeItem(index=0, newIndex=50) state: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertUndefined();
      logInfo(`changeItem(index=0, newIndex=50) state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`changeItem(index=0, newIndex=50) state: subject.offsets[0]=${subject.offsets[0]}`);
      expect(subject.offsets[0]).assertUndefined();
      logInfo(`${BUNDLE}ListExchangeModelChangeItem_0017 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_CHANGE_ITEM_0018
     * @tc.name      ListBeExchange_ListExchangeModelChangeItem_0018
     * @tc.desc      ListExchangeModel.changeItem(index=0, newIndex=55) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelChangeItem_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelChangeItem_0018 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      subject.changeItem(0, 55);
      logInfo(`changeItem(index=0, newIndex=55) state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`changeItem(index=0, newIndex=55) state: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertUndefined();
      logInfo(`changeItem(index=0, newIndex=55) state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`changeItem(index=0, newIndex=55) state: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertUndefined();
      logInfo(`changeItem(index=0, newIndex=55) state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`changeItem(index=0, newIndex=55) state: subject.offsets[0]=${subject.offsets[0]}`);
      expect(subject.offsets[0]).assertUndefined();
      logInfo(`${BUNDLE}ListExchangeModelChangeItem_0018 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_CHANGE_ITEM_0019
     * @tc.name      ListBeExchange_ListExchangeModelChangeItem_0019
     * @tc.desc      ListExchangeModel.changeItem(index=0, newIndex=60) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelChangeItem_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelChangeItem_0019 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      subject.changeItem(0, 60);
      logInfo(`changeItem(index=0, newIndex=60) state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`changeItem(index=0, newIndex=60) state: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertUndefined();
      logInfo(`changeItem(index=0, newIndex=60) state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`changeItem(index=0, newIndex=60) state: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertUndefined();
      logInfo(`changeItem(index=0, newIndex=60) state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`changeItem(index=0, newIndex=60) state: subject.offsets[0]=${subject.offsets[0]}`);
      expect(subject.offsets[0]).assertUndefined();
      logInfo(`${BUNDLE}ListExchangeModelChangeItem_0019 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_CHANGE_ITEM_0020
     * @tc.name      ListBeExchange_ListExchangeModelChangeItem_0020
     * @tc.desc      ListExchangeModel.changeItem(index=0, newIndex=65) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelChangeItem_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelChangeItem_0020 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      subject.changeItem(0, 65);
      logInfo(`changeItem(index=0, newIndex=65) state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`changeItem(index=0, newIndex=65) state: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertUndefined();
      logInfo(`changeItem(index=0, newIndex=65) state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`changeItem(index=0, newIndex=65) state: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertUndefined();
      logInfo(`changeItem(index=0, newIndex=65) state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`changeItem(index=0, newIndex=65) state: subject.offsets[0]=${subject.offsets[0]}`);
      expect(subject.offsets[0]).assertUndefined();
      logInfo(`${BUNDLE}ListExchangeModelChangeItem_0020 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_CHANGE_ITEM_0021
     * @tc.name      ListBeExchange_ListExchangeModelChangeItem_0021
     * @tc.desc      ListExchangeModel.changeItem(index=0, newIndex=70) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelChangeItem_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelChangeItem_0021 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      subject.changeItem(0, 70);
      logInfo(`changeItem(index=0, newIndex=70) state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`changeItem(index=0, newIndex=70) state: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertUndefined();
      logInfo(`changeItem(index=0, newIndex=70) state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`changeItem(index=0, newIndex=70) state: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertUndefined();
      logInfo(`changeItem(index=0, newIndex=70) state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`changeItem(index=0, newIndex=70) state: subject.offsets[0]=${subject.offsets[0]}`);
      expect(subject.offsets[0]).assertUndefined();
      logInfo(`${BUNDLE}ListExchangeModelChangeItem_0021 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_CHANGE_ITEM_0022
     * @tc.name      ListBeExchange_ListExchangeModelChangeItem_0022
     * @tc.desc      ListExchangeModel.changeItem(index=0, newIndex=75) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelChangeItem_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelChangeItem_0022 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      subject.changeItem(0, 75);
      logInfo(`changeItem(index=0, newIndex=75) state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`changeItem(index=0, newIndex=75) state: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertUndefined();
      logInfo(`changeItem(index=0, newIndex=75) state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`changeItem(index=0, newIndex=75) state: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertUndefined();
      logInfo(`changeItem(index=0, newIndex=75) state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`changeItem(index=0, newIndex=75) state: subject.offsets[0]=${subject.offsets[0]}`);
      expect(subject.offsets[0]).assertUndefined();
      logInfo(`${BUNDLE}ListExchangeModelChangeItem_0022 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_CHANGE_ITEM_0023
     * @tc.name      ListBeExchange_ListExchangeModelChangeItem_0023
     * @tc.desc      ListExchangeModel.changeItem(index=0, newIndex=80) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelChangeItem_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelChangeItem_0023 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      subject.changeItem(0, 80);
      logInfo(`changeItem(index=0, newIndex=80) state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`changeItem(index=0, newIndex=80) state: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertUndefined();
      logInfo(`changeItem(index=0, newIndex=80) state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`changeItem(index=0, newIndex=80) state: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertUndefined();
      logInfo(`changeItem(index=0, newIndex=80) state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`changeItem(index=0, newIndex=80) state: subject.offsets[0]=${subject.offsets[0]}`);
      expect(subject.offsets[0]).assertUndefined();
      logInfo(`${BUNDLE}ListExchangeModelChangeItem_0023 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_CHANGE_ITEM_0024
     * @tc.name      ListBeExchange_ListExchangeModelChangeItem_0024
     * @tc.desc      ListExchangeModel.changeItem(index=0, newIndex=85) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelChangeItem_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelChangeItem_0024 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      subject.changeItem(0, 85);
      logInfo(`changeItem(index=0, newIndex=85) state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`changeItem(index=0, newIndex=85) state: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertUndefined();
      logInfo(`changeItem(index=0, newIndex=85) state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`changeItem(index=0, newIndex=85) state: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertUndefined();
      logInfo(`changeItem(index=0, newIndex=85) state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`changeItem(index=0, newIndex=85) state: subject.offsets[0]=${subject.offsets[0]}`);
      expect(subject.offsets[0]).assertUndefined();
      logInfo(`${BUNDLE}ListExchangeModelChangeItem_0024 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_CHANGE_ITEM_0025
     * @tc.name      ListBeExchange_ListExchangeModelChangeItem_0025
     * @tc.desc      ListExchangeModel.changeItem(index=0, newIndex=90) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelChangeItem_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelChangeItem_0025 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      subject.changeItem(0, 90);
      logInfo(`changeItem(index=0, newIndex=90) state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`changeItem(index=0, newIndex=90) state: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertUndefined();
      logInfo(`changeItem(index=0, newIndex=90) state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`changeItem(index=0, newIndex=90) state: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertUndefined();
      logInfo(`changeItem(index=0, newIndex=90) state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`changeItem(index=0, newIndex=90) state: subject.offsets[0]=${subject.offsets[0]}`);
      expect(subject.offsets[0]).assertUndefined();
      logInfo(`${BUNDLE}ListExchangeModelChangeItem_0025 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_CHANGE_ITEM_0026
     * @tc.name      ListBeExchange_ListExchangeModelChangeItem_0026
     * @tc.desc      ListExchangeModel.changeItem(index=0, newIndex=95) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelChangeItem_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelChangeItem_0026 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      subject.changeItem(0, 95);
      logInfo(`changeItem(index=0, newIndex=95) state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`changeItem(index=0, newIndex=95) state: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertUndefined();
      logInfo(`changeItem(index=0, newIndex=95) state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`changeItem(index=0, newIndex=95) state: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertUndefined();
      logInfo(`changeItem(index=0, newIndex=95) state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`changeItem(index=0, newIndex=95) state: subject.offsets[0]=${subject.offsets[0]}`);
      expect(subject.offsets[0]).assertUndefined();
      logInfo(`${BUNDLE}ListExchangeModelChangeItem_0026 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_CHANGE_ITEM_0027
     * @tc.name      ListBeExchange_ListExchangeModelChangeItem_0027
     * @tc.desc      ListExchangeModel.changeItem(index=0, newIndex=105) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelChangeItem_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelChangeItem_0027 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      subject.changeItem(0, 105);
      logInfo(`changeItem(index=0, newIndex=105) state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`changeItem(index=0, newIndex=105) state: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertUndefined();
      logInfo(`changeItem(index=0, newIndex=105) state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`changeItem(index=0, newIndex=105) state: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertUndefined();
      logInfo(`changeItem(index=0, newIndex=105) state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`changeItem(index=0, newIndex=105) state: subject.offsets[0]=${subject.offsets[0]}`);
      expect(subject.offsets[0]).assertUndefined();
      logInfo(`${BUNDLE}ListExchangeModelChangeItem_0027 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_CHANGE_ITEM_0028
     * @tc.name      ListBeExchange_ListExchangeModelChangeItem_0028
     * @tc.desc      ListExchangeModel.changeItem(index=0, newIndex=-97) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_ListExchangeModelChangeItem_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelChangeItem_0028 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      subject.changeItem(0, -97);
      logInfo(`changeItem(index=0, newIndex=-97) state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`changeItem(index=0, newIndex=-97) state: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertUndefined();
      logInfo(`changeItem(index=0, newIndex=-97) state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`changeItem(index=0, newIndex=-97) state: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertUndefined();
      logInfo(`changeItem(index=0, newIndex=-97) state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`changeItem(index=0, newIndex=-97) state: subject.offsets[0]=${subject.offsets[0]}`);
      expect(subject.offsets[0]).assertUndefined();
      logInfo(`${BUNDLE}ListExchangeModelChangeItem_0028 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_CHANGE_ITEM_0029
     * @tc.name      ListBeExchange_ListExchangeModelChangeItem_0029
     * @tc.desc      ListExchangeModel.changeItem(index=0, newIndex=-83) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_ListExchangeModelChangeItem_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelChangeItem_0029 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      subject.changeItem(0, -83);
      logInfo(`changeItem(index=0, newIndex=-83) state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`changeItem(index=0, newIndex=-83) state: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertUndefined();
      logInfo(`changeItem(index=0, newIndex=-83) state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`changeItem(index=0, newIndex=-83) state: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertUndefined();
      logInfo(`changeItem(index=0, newIndex=-83) state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`changeItem(index=0, newIndex=-83) state: subject.offsets[0]=${subject.offsets[0]}`);
      expect(subject.offsets[0]).assertUndefined();
      logInfo(`${BUNDLE}ListExchangeModelChangeItem_0029 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_CHANGE_ITEM_0030
     * @tc.name      ListBeExchange_ListExchangeModelChangeItem_0030
     * @tc.desc      ListExchangeModel.changeItem(index=0, newIndex=34) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelChangeItem_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelChangeItem_0030 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      subject.changeItem(0, 34);
      logInfo(`changeItem(index=0, newIndex=34) state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`changeItem(index=0, newIndex=34) state: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertUndefined();
      logInfo(`changeItem(index=0, newIndex=34) state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`changeItem(index=0, newIndex=34) state: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertUndefined();
      logInfo(`changeItem(index=0, newIndex=34) state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`changeItem(index=0, newIndex=34) state: subject.offsets[0]=${subject.offsets[0]}`);
      expect(subject.offsets[0]).assertUndefined();
      logInfo(`${BUNDLE}ListExchangeModelChangeItem_0030 end`);
    });
  });
}
