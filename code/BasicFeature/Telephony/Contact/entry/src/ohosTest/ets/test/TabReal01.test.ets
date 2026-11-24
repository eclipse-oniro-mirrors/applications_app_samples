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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { TabConfig } from '../../../main/ets/utils/TabConfig';

const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_Contact]';

export default function tabReal01Test() {
  describe('TabReal01Test', () => {

    /**
     * @tc.name   testTabReal010001
     * @tc.number SUB_Contact_TABR_0001
     * @tc.desc   合法：首页 tab0 映射电话页，kindOf 返回 'call'（三分支）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTabReal010001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTabReal010001 begin');
      const kind: string = TabConfig.kindOf(0);
      const id: string = TabConfig.tabId(0);
      expect(kind).assertEqual('call');
      expect(id).assertEqual('tab0');
      expect(kind === 'contact').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTabReal010001 end');
    });

    /**
     * @tc.name   testTabReal010002
     * @tc.number SUB_Contact_TABR_0002
     * @tc.desc   合法：首页 tab1 映射联系人页，kindOf 返回 'contact'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTabReal010002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTabReal010002 begin');
      const kind: string = TabConfig.kindOf(1);
      const id: string = TabConfig.tabId(1);
      expect(kind).assertEqual('contact');
      expect(id).assertEqual('tab1');
      expect(kind === 'call').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTabReal010002 end');
    });

    /**
     * @tc.name   testTabReal010003
     * @tc.number SUB_Contact_TABR_0003
     * @tc.desc   合法：首页 tab2 映射收藏页，kindOf 返回 'collection'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTabReal010003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTabReal010003 begin');
      const kind: string = TabConfig.kindOf(2);
      const id: string = TabConfig.tabId(2);
      expect(kind).assertEqual('collection');
      expect(id).assertEqual('tab2');
      expect(kind === 'contact').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTabReal010003 end');
    });

    /**
     * @tc.name   testTabReal010004
     * @tc.number SUB_Contact_TABR_0004
     * @tc.desc   合法：isContactTab 仅在 index 1 返回 true（规格常量）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTabReal010004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTabReal010004 begin');
      const isContact: boolean = TabConfig.isContactTab(1);
      const isCall: boolean = TabConfig.isContactTab(0);
      expect(isContact).assertTrue();
      expect(isCall).assertFalse();
      expect(isContact === isCall).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTabReal010004 end');
    });

    /**
     * @tc.name   testTabReal010005
     * @tc.number SUB_Contact_TABR_0005
     * @tc.desc   合法：TAB_COUNT 固定为 3（规格常量，Home 页三个 TabContent）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTabReal010005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTabReal010005 begin');
      const count: number = TabConfig.TAB_COUNT;
      expect(count).assertEqual(3);
      expect(count > 0).assertTrue();
      expect(count === 4).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTabReal010005 end');
    });

    /**
     * @tc.name   testTabReal010006
     * @tc.number SUB_Contact_TABR_0006
     * @tc.desc   边界：index -1 落入 else 分支返回 'collection'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTabReal010006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTabReal010006 begin');
      const kind: string = TabConfig.kindOf(-1);
      const id: string = TabConfig.tabId(-1);
      expect(kind).assertEqual('collection');
      expect(id).assertEqual('tab-1');
      expect(kind === 'call').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTabReal010006 end');
    });

    /**
     * @tc.name   testTabReal010007
     * @tc.number SUB_Contact_TABR_0007
     * @tc.desc   边界：index 3 落入 else 分支返回 'collection'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTabReal010007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTabReal010007 begin');
      const kind: string = TabConfig.kindOf(3);
      const id: string = TabConfig.tabId(3);
      expect(kind).assertEqual('collection');
      expect(id).assertEqual('tab3');
      expect(kind === 'contact').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTabReal010007 end');
    });

    /**
     * @tc.name   testTabReal010008
     * @tc.number SUB_Contact_TABR_0008
     * @tc.desc   边界：isContactTab 在 0 与 2 均返回 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTabReal010008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTabReal010008 begin');
      const atZero: boolean = TabConfig.isContactTab(0);
      const atTwo: boolean = TabConfig.isContactTab(2);
      expect(atZero).assertFalse();
      expect(atTwo).assertFalse();
      expect(atZero === atTwo).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTabReal010008 end');
    });

    /**
     * @tc.name   testTabReal010009
     * @tc.number SUB_Contact_TABR_0009
     * @tc.desc   边界：tabId 对负号与正号拼接保持字符串前缀语义
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTabReal010009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTabReal010009 begin');
      const negId: string = TabConfig.tabId(-2);
      const zeroId: string = TabConfig.tabId(0);
      expect(negId).assertEqual('tab-2');
      expect(zeroId).assertEqual('tab0');
      expect(negId === zeroId).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTabReal010009 end');
    });

    /**
     * @tc.name   testTabReal010010
     * @tc.number SUB_Contact_TABR_0010
     * @tc.desc   边界：三个 tab id 两两不同且前缀一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTabReal010010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTabReal010010 begin');
      const id0: string = TabConfig.tabId(0);
      const id1: string = TabConfig.tabId(1);
      const id2: string = TabConfig.tabId(2);
      expect(id0).assertEqual('tab0');
      expect(id0 === id1).assertFalse();
      expect(id1 === id2).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTabReal010010 end');
    });

    /**
     * @tc.name   testTabReal010011
     * @tc.number SUB_Contact_TABR_0011
     * @tc.desc   非法：小数 1.5 不等同任何合法分支，落入 else 返回 'collection'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTabReal010011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTabReal010011 begin');
      const kind: string = TabConfig.kindOf(1.5);
      const isContact: boolean = TabConfig.isContactTab(1.5);
      expect(kind).assertEqual('collection');
      expect(isContact).assertFalse();
      expect(kind === 'contact').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTabReal010011 end');
    });

    /**
     * @tc.name   testTabReal010012
     * @tc.number SUB_Contact_TABR_0012
     * @tc.desc   非法：负小数 -0.5 落入 else 分支
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTabReal010012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTabReal010012 begin');
      const kind: string = TabConfig.kindOf(-0.5);
      expect(kind).assertEqual('collection');
      expect(TabConfig.isContactTab(-0.5)).assertFalse();
      expect(kind === 'call').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTabReal010012 end');
    });

    /**
     * @tc.name   testTabReal010013
     * @tc.number SUB_Contact_TABR_0013
     * @tc.desc   极值：MAX_SAFE_INTEGER 落入 else 分支，不溢出不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTabReal010013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTabReal010013 begin');
      const kind: string = TabConfig.kindOf(Number.MAX_SAFE_INTEGER);
      const id: string = TabConfig.tabId(Number.MAX_SAFE_INTEGER);
      expect(kind).assertEqual('collection');
      expect(id).assertEqual('tab' + String(Number.MAX_SAFE_INTEGER));
      expect(kind === 'contact').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTabReal010013 end');
    });

    /**
     * @tc.name   testTabReal010014
     * @tc.number SUB_Contact_TABR_0014
     * @tc.desc   极值：MIN_SAFE_INTEGER 落入 else 分支，返回与正极值同分支
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTabReal010014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTabReal010014 begin');
      const kind: string = TabConfig.kindOf(Number.MIN_SAFE_INTEGER);
      const maxKind: string = TabConfig.kindOf(Number.MAX_SAFE_INTEGER);
      expect(kind).assertEqual('collection');
      expect(maxKind).assertEqual('collection');
      expect(kind === maxKind).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTabReal010014 end');
    });

    /**
     * @tc.name   testTabReal010015
     * @tc.number SUB_Contact_TABR_0015
     * @tc.desc   极值：极大索引 tabId 不截断不溢出（字符串拼接语义）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTabReal010015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTabReal010015 begin');
      const id: string = TabConfig.tabId(1000000000000);
      expect(id).assertEqual('tab1000000000000');
      expect(id.length).assertEqual(16);
      expect(id === 'tab').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTabReal010015 end');
    });

    /**
     * @tc.name   testTabReal010016
     * @tc.number SUB_Contact_TABR_0016
     * @tc.desc   组合：kindOf 与 tabId 在同一 index 上保持一致映射（0→call/tab0）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTabReal010016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTabReal010016 begin');
      const kind: string = TabConfig.kindOf(0);
      const id: string = TabConfig.tabId(0);
      expect(kind).assertEqual('call');
      expect(id).assertEqual('tab0');
      expect(kind + id).assertEqual('calltab0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTabReal010016 end');
    });

    /**
     * @tc.name   testTabReal010017
     * @tc.number SUB_Contact_TABR_0017
     * @tc.desc   组合：kindOf 与 tabId 在同一 index 上保持一致映射（1→contact/tab1）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTabReal010017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTabReal010017 begin');
      const kind: string = TabConfig.kindOf(1);
      const id: string = TabConfig.tabId(1);
      expect(kind).assertEqual('contact');
      expect(id).assertEqual('tab1');
      expect(kind + id).assertEqual('contacttab1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTabReal010017 end');
    });

    /**
     * @tc.name   testTabReal010018
     * @tc.number SUB_Contact_TABR_0018
     * @tc.desc   组合：kindOf 与 tabId 在同一 index 上保持一致映射（2→collection/tab2）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTabReal010018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTabReal010018 begin');
      const kind: string = TabConfig.kindOf(2);
      const id: string = TabConfig.tabId(2);
      expect(kind).assertEqual('collection');
      expect(id).assertEqual('tab2');
      expect(kind + id).assertEqual('collectiontab2');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTabReal010018 end');
    });

    /**
     * @tc.name   testTabReal010019
     * @tc.number SUB_Contact_TABR_0019
     * @tc.desc   组合：三个分支的 kindOf 结果互不相同（三分支互斥规格）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTabReal010019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTabReal010019 begin');
      const kind0: string = TabConfig.kindOf(0);
      const kind1: string = TabConfig.kindOf(1);
      const kind2: string = TabConfig.kindOf(2);
      expect(kind0 === kind1).assertFalse();
      expect(kind1 === kind2).assertFalse();
      expect(kind0 === kind2).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTabReal010019 end');
    });

    /**
     * @tc.name   testTabReal010020
     * @tc.number SUB_Contact_TABR_0020
     * @tc.desc   组合：isContactTab 与 kindOf 在 0/1/2 三点的对应关系（1 为 contact 且 isContactTab 为 true）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTabReal010020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTabReal010020 begin');
      const kindAtOne: string = TabConfig.kindOf(1);
      const isContactAtOne: boolean = TabConfig.isContactTab(1);
      const isContactAtZero: boolean = TabConfig.isContactTab(0);
      expect(kindAtOne).assertEqual('contact');
      expect(isContactAtOne).assertTrue();
      expect(isContactAtZero).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTabReal010020 end');
    });

    /**
     * @tc.name   testTabReal010021
     * @tc.number SUB_Contact_TABR_0021
     * @tc.desc   幂等：kindOf 连续调用三次结果一致（无状态 SUT 状态维替代）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTabReal010021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTabReal010021 begin');
      const first: string = TabConfig.kindOf(1);
      const second: string = TabConfig.kindOf(1);
      const third: string = TabConfig.kindOf(1);
      expect(first === second).assertTrue();
      expect(second === third).assertTrue();
      expect(first).assertEqual('contact');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTabReal010021 end');
    });

    /**
     * @tc.name   testTabReal010022
     * @tc.number SUB_Contact_TABR_0022
     * @tc.desc   幂等：tabId 连续调用三次结果一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTabReal010022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTabReal010022 begin');
      const first: string = TabConfig.tabId(2);
      const second: string = TabConfig.tabId(2);
      const third: string = TabConfig.tabId(2);
      expect(first === second).assertTrue();
      expect(second === third).assertTrue();
      expect(first).assertEqual('tab2');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTabReal010022 end');
    });

    /**
     * @tc.name   testTabReal010023
     * @tc.number SUB_Contact_TABR_0023
     * @tc.desc   幂等：isContactTab 连续调用三次结果一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTabReal010023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTabReal010023 begin');
      const first: boolean = TabConfig.isContactTab(0);
      const second: boolean = TabConfig.isContactTab(0);
      const third: boolean = TabConfig.isContactTab(0);
      expect(first === second).assertTrue();
      expect(second === third).assertTrue();
      expect(first).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTabReal010023 end');
    });

    /**
     * @tc.name   testTabReal010024
     * @tc.number SUB_Contact_TABR_0024
     * @tc.desc   状态不变量：TAB_COUNT 常量在多次读取中保持不变
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTabReal010024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTabReal010024 begin');
      const first: number = TabConfig.TAB_COUNT;
      const second: number = TabConfig.TAB_COUNT;
      expect(first).assertEqual(3);
      expect(first === second).assertTrue();
      expect(first > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTabReal010024 end');
    });

    /**
     * @tc.name   testTabReal010025
     * @tc.number SUB_Contact_TABR_0025
     * @tc.desc   状态序列：0→1→2 顺序切换 kindOf 结果各不相同（模拟用户顺序切 tab）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTabReal010025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTabReal010025 begin');
      const kinds: string[] = [TabConfig.kindOf(0), TabConfig.kindOf(1), TabConfig.kindOf(2)];
      expect(kinds[0]).assertEqual('call');
      expect(kinds[1]).assertEqual('contact');
      expect(kinds[2]).assertEqual('collection');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTabReal010025 end');
    });

    /**
     * @tc.name   testTabReal010026
     * @tc.number SUB_Contact_TABR_0026
     * @tc.desc   状态序列：2→1→0 逆序切换 kindOf 结果与顺序切换对称
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTabReal010026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTabReal010026 begin');
      const reverseKinds: string[] = [TabConfig.kindOf(2), TabConfig.kindOf(1), TabConfig.kindOf(0)];
      expect(reverseKinds[0]).assertEqual('collection');
      expect(reverseKinds[1]).assertEqual('contact');
      expect(reverseKinds[2]).assertEqual('call');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTabReal010026 end');
    });

    /**
     * @tc.name   testTabReal010027
     * @tc.number SUB_Contact_TABR_0027
     * @tc.desc   数据表基线 v1：tab 配置三元组（index, kind, id）逐项断言
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTabReal010027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTabReal010027 begin');
      expect(TabConfig.kindOf(0)).assertEqual('call');
      expect(TabConfig.kindOf(1)).assertEqual('contact');
      expect(TabConfig.kindOf(2)).assertEqual('collection');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTabReal010027 end');
    });

    /**
     * @tc.name   testTabReal010028
     * @tc.number SUB_Contact_TABR_0028
     * @tc.desc   数据表基线 v1：tab id 三元组逐项断言
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTabReal010028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTabReal010028 begin');
      expect(TabConfig.tabId(0)).assertEqual('tab0');
      expect(TabConfig.tabId(1)).assertEqual('tab1');
      expect(TabConfig.tabId(2)).assertEqual('tab2');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTabReal010028 end');
    });

    /**
     * @tc.name   testTabReal010029
     * @tc.number SUB_Contact_TABR_0029
     * @tc.desc   数据表基线 v1：isContactTab 三元组逐项断言
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTabReal010029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTabReal010029 begin');
      expect(TabConfig.isContactTab(0)).assertFalse();
      expect(TabConfig.isContactTab(1)).assertTrue();
      expect(TabConfig.isContactTab(2)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTabReal010029 end');
    });

    /**
     * @tc.name   testTabReal010030
     * @tc.number SUB_Contact_TABR_0030
     * @tc.desc   哨兵：非法索引 -1 与 3 落在同一 else 分支，且与合法三分支互斥
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTabReal010030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTabReal010030 begin');
      const negKind: string = TabConfig.kindOf(-1);
      const overKind: string = TabConfig.kindOf(3);
      expect(negKind).assertEqual('collection');
      expect(overKind).assertEqual('collection');
      expect(negKind === TabConfig.kindOf(0)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTabReal010030 end');
    });

  });
}
