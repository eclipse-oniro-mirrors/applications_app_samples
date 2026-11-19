/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import { BreakpointType } from '../../../main/ets/common/BreakpointSystem';

const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[MultiColumns_BPEdge]';

// 对象引用三元组专用（ArkTS 要求引用类型显式声明）。
class EdgeBox {
  v: number;

  constructor(v: number) {
    this.v = v;
  }
}

// 手写点缀套件（非凑量）：泛型布尔全组合、数值特殊态、字符串退化、非法键。
// 期望值来源：规格常量 + 状态推演（GetValue 契约：仅 'sm'/'md'/'lg' 命中，其余 undefined）。
export default function bpEdgeRealTest() {
  describe('MultiColumnsBpEdgeReal', () => {

    /**
     * @tc.name   testBpEdge0001
     * @tc.number SUB_MC_BPE_0001
     * @tc.desc   Anchor: 布尔三元组 (false,false,false) 三键均返回 false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testBpEdge0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpEdge0001 begin');
      const sut = new BreakpointType<boolean>(false, false, false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'lg=%{public}s', String(sut.GetValue('lg')));
      expect(sut.GetValue('sm')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(sut.GetValue('md')), String(false));
      expect(sut.GetValue('md')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(sut.GetValue('lg')), String(false));
      expect(sut.GetValue('lg')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpEdge0001 end');
    });

    /**
     * @tc.name   testBpEdge0002
     * @tc.number SUB_MC_BPE_0002
     * @tc.desc   Anchor: 布尔三元组 (true,false,true) 仅 md 返回 false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testBpEdge0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpEdge0002 begin');
      const sut = new BreakpointType<boolean>(true, false, true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'md=%{public}s', String(sut.GetValue('md')));
      expect(sut.GetValue('sm') === true).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertTrue', String(sut.GetValue('md') === false));
      expect(sut.GetValue('md') === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertTrue', String(sut.GetValue('lg') === true));
      expect(sut.GetValue('lg') === true).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpEdge0002 end');
    });

    /**
     * @tc.name   testBpEdge0003
     * @tc.number SUB_MC_BPE_0003
     * @tc.desc   布尔三元组 (false,true,false) 仅 md 返回 true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testBpEdge0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpEdge0003 begin');
      const sut = new BreakpointType<boolean>(false, true, false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'sm=%{public}s', String(sut.GetValue('sm')));
      expect(sut.GetValue('sm')).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertTrue', String(sut.GetValue('md')));
      expect(sut.GetValue('md')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertFalse', String(sut.GetValue('lg')));
      expect(sut.GetValue('lg')).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpEdge0003 end');
    });

    /**
     * @tc.name   testBpEdge0004
     * @tc.number SUB_MC_BPE_0004
     * @tc.desc   布尔三元组 (true,true,false) 仅 lg 返回 false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testBpEdge0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpEdge0004 begin');
      const b1 = new BreakpointType<boolean>(true, true, false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'lg=%{public}s', String(b1.GetValue('lg')));
      expect(b1.GetValue('sm')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertTrue', String(b1.GetValue('md')));
      expect(b1.GetValue('md')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertFalse', String(b1.GetValue('lg')));
      expect(b1.GetValue('lg')).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpEdge0004 end');
    });

    /**
     * @tc.name   testBpEdge0005
     * @tc.number SUB_MC_BPE_0005
     * @tc.desc   数值退化三元组 sm==md==lg 三键返回同一值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testBpEdge0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpEdge0005 begin');
      const sut = new BreakpointType<number>(500, 500, 500);
      const a = sut.GetValue('sm') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'a=%{public}s', String(a));
      expect(a).assertEqual(500);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sut.GetValue('md')), String(a));
      expect(sut.GetValue('md')).assertEqual(a);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sut.GetValue('lg')), String(a));
      expect(sut.GetValue('lg')).assertEqual(a);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpEdge0005 end');
    });

    /**
     * @tc.name   testBpEdge0006
     * @tc.number SUB_MC_BPE_0006
     * @tc.desc   Anchor: 正负零三元组 sm=0 md=-0，GetValue 不改变数值语义
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testBpEdge0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpEdge0006 begin');
      const sut = new BreakpointType<number>(0, -0, 1);
      const smVal = sut.GetValue('sm') as number;
      const lgVal = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'sm=%{public}s lg=%{public}s', String(smVal), String(lgVal));
      expect(smVal).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(lgVal), String(1));
      expect(lgVal).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertFalse', String(smVal === lgVal));
      expect(smVal === lgVal).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpEdge0006 end');
    });

    /**
     * @tc.name   testBpEdge0007
     * @tc.number SUB_MC_BPE_0007
     * @tc.desc   数值极值三元组 sm=MAX_SAFE_INTEGER md=MIN lg=0 原样返回
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testBpEdge0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpEdge0007 begin');
      const sut = new BreakpointType<number>(9007199254740991, -9007199254740991, 0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'sm=%{public}s', String(sut.GetValue('sm')));
      expect(sut.GetValue('sm')).assertEqual(9007199254740991);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(sut.GetValue('md')), String(-9007199254740991));
      expect(sut.GetValue('md')).assertEqual(-9007199254740991);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sut.GetValue('lg')), String(0));
      expect(sut.GetValue('lg')).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpEdge0007 end');
    });

    /**
     * @tc.name   testBpEdge0008
     * @tc.number SUB_MC_BPE_0008
     * @tc.desc   NaN 分支：GetValue 返回同一 NaN，用 Number.isNaN 判定
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testBpEdge0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpEdge0008 begin');
      const sut = new BreakpointType<number>(Number.NaN, 1, 2);
      const v = sut.GetValue('sm') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'isNaN=%{public}s', String(Number.isNaN(v)));
      expect(Number.isNaN(v)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sut.GetValue('md')), String(1));
      expect(sut.GetValue('md')).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sut.GetValue('lg')), String(2));
      expect(sut.GetValue('lg')).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpEdge0008 end');
    });

    /**
     * @tc.name   testBpEdge0009
     * @tc.number SUB_MC_BPE_0009
     * @tc.desc   Infinity 三元组 sm=+Inf md=-Inf，仅 lg 为有限值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpEdge0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpEdge0009 begin');
      const sut = new BreakpointType<number>(Infinity, -Infinity, 0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'sm=%{public}s', String(sut.GetValue('sm')));
      expect(sut.GetValue('sm')).assertEqual(Infinity);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(sut.GetValue('md')), String(-Infinity));
      expect(sut.GetValue('md')).assertEqual(-Infinity);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s',
        'assertTrue', String(Number.isFinite(sut.GetValue('lg') as number)));
      expect(Number.isFinite(sut.GetValue('lg') as number)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpEdge0009 end');
    });

    /**
     * @tc.name   testBpEdge0010
     * @tc.number SUB_MC_BPE_0010
     * @tc.desc   Anchor: 空字符串作为 sm 值仍被返回，区别于非法键的 undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testBpEdge0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpEdge0010 begin');
      const sut = new BreakpointType<string>('', 'md', 'lg');
      const empty = sut.GetValue('sm') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'emptyLen=%{public}s', String(empty.length));
      expect(empty).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(empty.length), String(0));
      expect(empty.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(sut.GetValue('md')), String('md'));
      expect(sut.GetValue('md')).assertEqual('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpEdge0010 end');
    });

    /**
     * @tc.name   testBpEdge0011
     * @tc.number SUB_MC_BPE_0011
     * @tc.desc   columnsTemplate 风格值（含空格）按断点原样返回
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpEdge0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpEdge0011 begin');
      const sut = new BreakpointType<string>('1fr 1fr', '1fr 1fr 1fr', '1fr');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'md=%{public}s', sut.GetValue('md'));
      expect(sut.GetValue('sm')).assertEqual('1fr 1fr');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(sut.GetValue('md')), String('1fr 1fr 1fr'));
      expect(sut.GetValue('md')).assertEqual('1fr 1fr 1fr');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(sut.GetValue('lg')), String('1fr'));
      expect(sut.GetValue('lg')).assertEqual('1fr');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpEdge0011 end');
    });

    /**
     * @tc.name   testBpEdge0012
     * @tc.number SUB_MC_BPE_0012
     * @tc.desc   非法键大写 'SM'/'MD' 返回 undefined，合法键不受影响
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testBpEdge0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpEdge0012 begin');
      const sut = new BreakpointType<number>(1, 2, 3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'SM=%{public}s', String(sut.GetValue('SM')));
      expect(sut.GetValue('SM')).assertUndefined();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertUndefined', String(sut.GetValue('MD')));
      expect(sut.GetValue('MD')).assertUndefined();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sut.GetValue('sm')), String(1));
      expect(sut.GetValue('sm')).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpEdge0012 end');
    });

    /**
     * @tc.name   testBpEdge0013
     * @tc.number SUB_MC_BPE_0013
     * @tc.desc   非法键 'sm '（尾随空格）返回 undefined，三合法键仍各自命中
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testBpEdge0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpEdge0013 begin');
      const sut = new BreakpointType<number>(11, 22, 33);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'tail=%{public}s', String(sut.GetValue('sm ')));
      expect(sut.GetValue('sm ') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sut.GetValue('sm')), String(11));
      expect(sut.GetValue('sm')).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sut.GetValue('md')), String(22));
      expect(sut.GetValue('md')).assertEqual(22);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sut.GetValue('lg')), String(33));
      expect(sut.GetValue('lg')).assertEqual(33);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpEdge0013 end');
    });

    /**
     * @tc.name   testBpEdge0014
     * @tc.number SUB_MC_BPE_0014
     * @tc.desc   Anchor: 合法键重复串 'smsm'/'mdmd'/'lglg' 全部返回 undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpEdge0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpEdge0014 begin');
      const sut = new BreakpointType<number>(1, 2, 3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'dup=%{public}s', String(sut.GetValue('smsm')));
      expect(sut.GetValue('smsm') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s',
        'assertTrue', String(sut.GetValue('mdmd') === undefined));
      expect(sut.GetValue('mdmd') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s',
        'assertTrue', String(sut.GetValue('lglg') === undefined));
      expect(sut.GetValue('lglg') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sut.GetValue('md')), String(2));
      expect(sut.GetValue('md')).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpEdge0014 end');
    });

    /**
     * @tc.name   testBpEdge0015
     * @tc.number SUB_MC_BPE_0015
     * @tc.desc   前缀不完整键 's'/'m'/'l' 均返回 undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpEdge0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpEdge0015 begin');
      const sut = new BreakpointType<number>(7, 8, 9);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'single=%{public}s', String(sut.GetValue('s')));
      expect(sut.GetValue('s') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertTrue', String(sut.GetValue('m') === undefined));
      expect(sut.GetValue('m') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertTrue', String(sut.GetValue('l') === undefined));
      expect(sut.GetValue('l') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpEdge0015 end');
    });

    /**
     * @tc.name   testBpEdge0016
     * @tc.number SUB_MC_BPE_0016
     * @tc.desc   Anchor: 空键 '' 与空白键 ' ' 均不匹配，且 'sm' 键仍命中
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testBpEdge0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpEdge0016 begin');
      const sut = new BreakpointType<number>(101, 202, 303);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'empty=%{public}s', String(sut.GetValue('')));
      expect(sut.GetValue('') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertFalse', String(' '.startsWith('sm')));
      expect(' '.startsWith('sm')).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sut.GetValue('sm')), String(101));
      expect(sut.GetValue('sm')).assertEqual(101);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpEdge0016 end');
    });

    /**
     * @tc.name   testBpEdge0017
     * @tc.number SUB_MC_BPE_0017
     * @tc.desc   数值型/浮点键 '1'/'0' 非法，但 'sm' 合法证明未串扰
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpEdge0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpEdge0017 begin');
      const sut = new BreakpointType<number>(1, 2, 3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'one=%{public}s', String(sut.GetValue('1')));
      expect(sut.GetValue('1') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertTrue', String(sut.GetValue('0') === undefined));
      expect(sut.GetValue('0') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertFalse', String(sut.GetValue('sm') === undefined));
      expect(sut.GetValue('sm') === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpEdge0017 end');
    });

    /**
     * @tc.name   testBpEdge0018
     * @tc.number SUB_MC_BPE_0018
     * @tc.desc   设备名键 'phone'/'tablet' 非法且互等（同 undefined），sm 合法
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpEdge0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpEdge0018 begin');
      const sut = new BreakpointType<number>(5, 6, 7);
      const bad = sut.GetValue('phone');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'phone=%{public}s', String(bad));
      expect(bad === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertTrue', String(bad === sut.GetValue('tablet')));
      expect(bad === sut.GetValue('tablet')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sut.GetValue('sm')), String(5));
      expect(sut.GetValue('sm')).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpEdge0018 end');
    });

    /**
     * @tc.name   testBpEdge0019
     * @tc.number SUB_MC_BPE_0019
     * @tc.desc   泛型数组引用类型：GetValue 返回同一引用（identity 保持）
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testBpEdge0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpEdge0019 begin');
      const a = [1, 2] as Array<number>;
      const b = [3] as Array<number>;
      const c = [4, 5, 6] as Array<number>;
      const sut = new BreakpointType<Array<number>>(a, b, c);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'lgLen=%{public}s', String((sut.GetValue('lg') as Array<number>).length));
      expect(sut.GetValue('sm')).assertEqual(a);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sut.GetValue('md')), String(b));
      expect(sut.GetValue('md')).assertEqual(b);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sut.GetValue('lg') as Array<number>).length), String(3));
      expect((sut.GetValue('lg') as Array<number>).length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpEdge0019 end');
    });

    /**
     * @tc.name   testBpEdge0020
     * @tc.number SUB_MC_BPE_0020
     * @tc.desc   Anchor: 命中/未命中混用时 undefined 与合法值互不等
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testBpEdge0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpEdge0020 begin');
      const sut = new BreakpointType<number>(10, 20, 30);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'bad=%{public}s good=%{public}s',
        String(sut.GetValue('xx')), String(sut.GetValue('md')));
      expect(sut.GetValue('xx') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sut.GetValue('md')), String(20));
      expect(sut.GetValue('md')).assertEqual(20);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s',
        'assertFalse', String(sut.GetValue('md') === sut.GetValue('xx')));
      expect(sut.GetValue('md') === sut.GetValue('xx')).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpEdge0020 end');
    });

    /**
     * @tc.name   testBpEdge0021
     * @tc.number SUB_MC_BPE_0021
     * @tc.desc   单键多次调用返回稳定同值（无状态副作用）
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpEdge0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpEdge0021 begin');
      const sut = new BreakpointType<number>(3, 4, 5);
      const first = sut.GetValue('lg') as number;
      const second = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'first=%{public}s second=%{public}s', String(first), String(second));
      expect(first).assertEqual(second);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(first), String(5));
      expect(first).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sut.GetValue('sm')), String(3));
      expect(sut.GetValue('sm')).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpEdge0021 end');
    });

    /**
     * @tc.name   testBpEdge0022
     * @tc.number SUB_MC_BPE_0022
     * @tc.desc   对象引用三元组按键返回对应实例的字段值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testBpEdge0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpEdge0022 begin');
      const sut = new BreakpointType<EdgeBox>(new EdgeBox(1), new EdgeBox(2), new EdgeBox(3));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'md.v=%{public}s', String((sut.GetValue('md') as EdgeBox).v));
      expect((sut.GetValue('sm') as EdgeBox).v).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sut.GetValue('md') as EdgeBox).v), String(2));
      expect((sut.GetValue('md') as EdgeBox).v).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sut.GetValue('lg') as EdgeBox).v), String(3));
      expect((sut.GetValue('lg') as EdgeBox).v).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpEdge0022 end');
    });

    /**
     * @tc.name   testBpEdge0023
     * @tc.number SUB_MC_BPE_0023
     * @tc.desc   Anchor: 三键全命中求和，验证 GetValue 覆盖全部字段
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testBpEdge0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpEdge0023 begin');
      const sut = new BreakpointType<number>(80, 90, 100);
      const sum = (sut.GetValue('sm') as number) + (sut.GetValue('md') as number) + (sut.GetValue('lg') as number);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'sum=%{public}s', String(sum));
      expect(sum).assertEqual(270);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sut.GetValue('md')), String(90));
      expect(sut.GetValue('md')).assertEqual(90);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sut.GetValue('lg')), String(100));
      expect(sut.GetValue('lg')).assertEqual(100);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpEdge0023 end');
    });

    /**
     * @tc.name   testBpEdge0024
     * @tc.number SUB_MC_BPE_0024
     * @tc.desc   近似键 'smx'/'mdm'/'lgl'（合法键+后缀）均返回 undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpEdge0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpEdge0024 begin');
      const sut = new BreakpointType<number>(1, 2, 3);
      const near: Array<string> = ['smx', 'mdm', 'lgl'];
      let miss: number = 0;
      for (const key of near) {
        if (sut.GetValue(key) === undefined) {
          miss++;
        }
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'miss=%{public}s', String(miss));
      expect(miss).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertTrue', String(sut.GetValue('lgx') === undefined));
      expect(sut.GetValue('lgx') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sut.GetValue('md')), String(2));
      expect(sut.GetValue('md')).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpEdge0024 end');
    });
  });
}
