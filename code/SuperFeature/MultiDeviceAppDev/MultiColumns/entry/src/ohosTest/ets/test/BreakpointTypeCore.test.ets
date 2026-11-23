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

import { describe, beforeEach, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BreakpointType } from '../../../main/ets/common/BreakpointSystem';

const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[MultiColumns_BP]';

// 泛型 T 引用类型用例专用（ArkTS 要求对象字面量对应显式声明类型）
class BPBox {
  v: number;

  constructor(v: number) {
    this.v = v;
  }
}

// 期望值来源：规格常量。BreakpointType.GetValue 契约：
// 'sm' 返回 sm 字段，'md' 返回 md 字段，'lg' 返回 lg 字段，其余任何输入返回 undefined。
export default function breakpointTypeCoreTest() {
  describe('MultiColumnsBreakpointTest', () => {
    // 冻结基线三元组（number）
    const SM: number = 100;
    const MD: number = 200;
    const LG: number = 300;
    let sut: BreakpointType<number> = new BreakpointType<number>(SM, MD, LG);

    beforeEach(() => {
      sut = new BreakpointType<number>(SM, MD, LG);
    });

    afterEach(() => {
      sut = new BreakpointType<number>(SM, MD, LG);
    });

    /**
     * @tc.number SUB_MC_BP_0001
     * @tc.name testBreakpoint0001
     * @tc.desc 合法值：'sm' 返回构造时传入的 sm 值
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('testBreakpoint0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBreakpoint0001 begin');
      const actual = sut.GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(actual), String(SM));
      expect(actual).assertEqual(SM);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertFalse', String(actual === MD));
      expect(actual === MD).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertFalse', String(actual === LG));
      expect(actual === LG).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBreakpoint0001 end');
    });

    /**
     * @tc.number SUB_MC_BP_0002
     * @tc.name testBreakpoint0002
     * @tc.desc 合法值：'md' 返回构造时传入的 md 值
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('testBreakpoint0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBreakpoint0002 begin');
      const actual = sut.GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(actual), String(MD));
      expect(actual).assertEqual(MD);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertFalse', String(actual === SM));
      expect(actual === SM).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertFalse', String(actual === LG));
      expect(actual === LG).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBreakpoint0002 end');
    });

    /**
     * @tc.number SUB_MC_BP_0003
     * @tc.name testBreakpoint0003
     * @tc.desc 合法值：'lg' 返回构造时传入的 lg 值
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('testBreakpoint0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBreakpoint0003 begin');
      const actual = sut.GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(actual), String(LG));
      expect(actual).assertEqual(LG);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertFalse', String(actual === SM));
      expect(actual === SM).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertFalse', String(actual === MD));
      expect(actual === MD).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBreakpoint0003 end');
    });

    /**
     * @tc.number SUB_MC_BP_0004
     * @tc.name testBreakpoint0004
     * @tc.desc 合法值：泛型 T=string 时按断点返回对应字符串
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('testBreakpoint0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBreakpoint0004 begin');
      const strSut = new BreakpointType<string>('1fr', '1fr 1fr', '1fr 1fr 1fr');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', strSut.GetValue('md'));
      expect(strSut.GetValue('sm')).assertEqual('1fr');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(strSut.GetValue('md')), String('1fr 1fr'));
      expect(strSut.GetValue('md')).assertEqual('1fr 1fr');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(strSut.GetValue('lg')), String('1fr 1fr 1fr'));
      expect(strSut.GetValue('lg')).assertEqual('1fr 1fr 1fr');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBreakpoint0004 end');
    });

    /**
     * @tc.number SUB_MC_BP_0005
     * @tc.name testBreakpoint0005
     * @tc.desc 合法值：泛型 T=boolean 时按断点返回对应布尔
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL1
     */
    it('testBreakpoint0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBreakpoint0005 begin');
      const boolSut = new BreakpointType<boolean>(false, false, true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'lg actual=%{public}s', String(boolSut.GetValue('lg')));
      expect(boolSut.GetValue('sm')).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertFalse', String(boolSut.GetValue('md')));
      expect(boolSut.GetValue('md')).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertTrue', String(boolSut.GetValue('lg')));
      expect(boolSut.GetValue('lg')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBreakpoint0005 end');
    });

    /**
     * @tc.number SUB_MC_BP_0006
     * @tc.name testBreakpoint0006
     * @tc.desc 合法值：泛型 T 引用类型时按断点返回对应实例
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL1
     */
    it('testBreakpoint0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBreakpoint0006 begin');
      const objSut = new BreakpointType<BPBox>(new BPBox(1), new BPBox(2), new BPBox(3));
      const smActual = objSut.GetValue('sm') as BPBox;
      const mdActual = objSut.GetValue('md') as BPBox;
      const lgActual = objSut.GetValue('lg') as BPBox;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'lg.v=%{public}d', lgActual.v);
      expect(smActual.v).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(mdActual.v), String(2));
      expect(mdActual.v).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(lgActual.v), String(3));
      expect(lgActual.v).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBreakpoint0006 end');
    });

    /**
     * @tc.number SUB_MC_BP_0007
     * @tc.name testBreakpoint0007
     * @tc.desc 边界值：空字符串不匹配任何断点，返回 undefined
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL1
     */
    it('testBreakpoint0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBreakpoint0007 begin');
      const actual = sut.GetValue('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(actual));
      expect(actual === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertFalse', String(actual === SM));
      expect(actual === SM).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertFalse', String(actual === MD));
      expect(actual === MD).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBreakpoint0007 end');
    });

    /**
     * @tc.number SUB_MC_BP_0008
     * @tc.name testBreakpoint0008
     * @tc.desc 边界值：单字符 's' 前缀不完整，返回 undefined
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL1
     */
    it('testBreakpoint0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBreakpoint0008 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(sut.GetValue('s')));
      expect(sut.GetValue('s') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertTrue', String(sut.GetValue('m') === undefined));
      expect(sut.GetValue('m') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertTrue', String(sut.GetValue('sm') === SM));
      expect(sut.GetValue('sm') === SM).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBreakpoint0008 end');
    });

    /**
     * @tc.number SUB_MC_BP_0009
     * @tc.name testBreakpoint0009
     * @tc.desc 边界值：合法断点补空格后不匹配，返回 undefined
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL1
     */
    it('testBreakpoint0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBreakpoint0009 begin');
      const padded = ' sm';
      const result = sut.GetValue(padded);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'padded.length=%{public}d result=%{public}s', padded.length, String(result));
      expect(result === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(padded.length), String(3));
      expect(padded.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(sut.GetValue(padded.trim())), String(SM));
      expect(sut.GetValue(padded.trim())).assertEqual(SM);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBreakpoint0009 end');
    });

    /**
     * @tc.number SUB_MC_BP_0010
     * @tc.name testBreakpoint0010
     * @tc.desc 边界值：三断点全命中且互不串值
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('testBreakpoint0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBreakpoint0010 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'sm=%{public}s md=%{public}s lg=%{public}s',
        String(sut.GetValue('sm')), String(sut.GetValue('md')), String(sut.GetValue('lg')));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sut.GetValue('sm')), String(SM));
      expect(sut.GetValue('sm')).assertEqual(SM);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sut.GetValue('md')), String(MD));
      expect(sut.GetValue('md')).assertEqual(MD);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sut.GetValue('lg')), String(LG));
      expect(sut.GetValue('lg')).assertEqual(LG);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBreakpoint0010 end');
    });

    /**
     * @tc.number SUB_MC_BP_0011
     * @tc.name testBreakpoint0011
     * @tc.desc 非法值：未知断点 'xl'/'md+' 返回 undefined
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL1
     */
    it('testBreakpoint0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBreakpoint0011 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'xl=%{public}s', String(sut.GetValue('xl')));
      expect(sut.GetValue('xl') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertTrue', String(sut.GetValue('md+') === undefined));
      expect(sut.GetValue('md+') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertTrue', String(sut.GetValue('lg') === LG));
      expect(sut.GetValue('lg') === LG).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBreakpoint0011 end');
    });

    /**
     * @tc.number SUB_MC_BP_0012
     * @tc.name testBreakpoint0012
     * @tc.desc 非法值：大小写敏感，'SM'/'Md'/'lG' 返回 undefined
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL1
     */
    it('testBreakpoint0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBreakpoint0012 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'SM=%{public}s', String(sut.GetValue('SM')));
      expect(sut.GetValue('SM') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertTrue', String(sut.GetValue('Md') === undefined));
      expect(sut.GetValue('Md') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertTrue', String(sut.GetValue('md') === MD));
      expect(sut.GetValue('md') === MD).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBreakpoint0012 end');
    });

    /**
     * @tc.number SUB_MC_BP_0013
     * @tc.name testBreakpoint0013
     * @tc.desc 非法值：包含合法前缀但更长的字符串返回 undefined
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL1
     */
    it('testBreakpoint0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBreakpoint0013 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'smx=%{public}s', String(sut.GetValue('smx')));
      expect(sut.GetValue('smx') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertTrue', String(sut.GetValue('mdm') === undefined));
      expect(sut.GetValue('mdm') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertTrue', String(sut.GetValue('lgl') === undefined));
      expect(sut.GetValue('lgl') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBreakpoint0013 end');
    });

    /**
     * @tc.number SUB_MC_BP_0014
     * @tc.name testBreakpoint0014
     * @tc.desc 极值：超长字符串断点返回 undefined 且不抛异常
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('testBreakpoint0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBreakpoint0014 begin');
      let longKey = 'sm';
      for (let i = 0; i < 50; i++) {
        longKey += 'x';
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'longKey.length=%{public}d', longKey.length);
      expect(sut.GetValue(longKey) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s',
        'assertTrue', String(sut.GetValue(longKey + 'md') === undefined));
      expect(sut.GetValue(longKey + 'md') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertTrue', String(sut.GetValue('sm') === SM));
      expect(sut.GetValue('sm') === SM).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBreakpoint0014 end');
    });

    /**
     * @tc.number SUB_MC_BP_0015
     * @tc.name testBreakpoint0015
     * @tc.desc 极值：数字串/'0' 等非断点字符串返回 undefined
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('testBreakpoint0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBreakpoint0015 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(sut.GetValue('0')));
      expect(sut.GetValue('0') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertTrue', String(sut.GetValue('12') === undefined));
      expect(sut.GetValue('12') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertTrue', String(sut.GetValue('lg') === LG));
      expect(sut.GetValue('lg') === LG).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBreakpoint0015 end');
    });

    /**
     * @tc.number SUB_MC_BP_0016
     * @tc.name testBreakpoint0016
     * @tc.desc 组合值：sm/md/lg 三者取值互异时逐一对应正确
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('testBreakpoint0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBreakpoint0016 begin');
      const mixSut = new BreakpointType<number>(1, 2, 4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'sm/md/lg=%{public}s/%{public}s/%{public}s',
        String(mixSut.GetValue('sm')), String(mixSut.GetValue('md')), String(mixSut.GetValue('lg')));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(mixSut.GetValue('sm')), String(1));
      expect(mixSut.GetValue('sm')).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(mixSut.GetValue('md')), String(2));
      expect(mixSut.GetValue('md')).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(mixSut.GetValue('lg')), String(4));
      expect(mixSut.GetValue('lg')).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBreakpoint0016 end');
    });

    /**
     * @tc.number SUB_MC_BP_0017
     * @tc.name testBreakpoint0017
     * @tc.desc 组合值：sm/md/lg 三者相等时任意断点返回同一值
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('testBreakpoint0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBreakpoint0017 begin');
      const sameSut = new BreakpointType<number>(7, 7, 7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual sm=%{public}s', String(sameSut.GetValue('sm')));
      expect(sameSut.GetValue('sm')).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(sameSut.GetValue('md')), String(7));
      expect(sameSut.GetValue('md')).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(sameSut.GetValue('lg')), String(7));
      expect(sameSut.GetValue('lg')).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBreakpoint0017 end');
    });

    /**
     * @tc.number SUB_MC_BP_0018
     * @tc.name testBreakpoint0018
     * @tc.desc 组合值：源 MailNavigation navBarWidth 基线 (321,321,390)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('testBreakpoint0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBreakpoint0018 begin');
      const navSut = new BreakpointType<number>(321, 321, 390);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'lg=%{public}s', String(navSut.GetValue('lg')));
      expect(navSut.GetValue('sm')).assertEqual(321);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(navSut.GetValue('md')), String(321));
      expect(navSut.GetValue('md')).assertEqual(321);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(navSut.GetValue('lg')), String(390));
      expect(navSut.GetValue('lg')).assertEqual(390);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBreakpoint0018 end');
    });

    /**
     * @tc.number SUB_MC_BP_0019
     * @tc.name testBreakpoint0019
     * @tc.desc 状态：同一实例重复调用相同断点结果稳定（幂等）
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('testBreakpoint0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBreakpoint0019 begin');
      const first = sut.GetValue('md');
      const second = sut.GetValue('md');
      const third = sut.GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'first=%{public}s second=%{public}s', String(first), String(second));
      expect(first).assertEqual(MD);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(second), String(first));
      expect(second).assertEqual(first);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(third), String(MD));
      expect(third).assertEqual(MD);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBreakpoint0019 end');
    });

    /**
     * @tc.number SUB_MC_BP_0020
     * @tc.name testBreakpoint0020
     * @tc.desc 状态：交替调用不同断点不相互影响
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('testBreakpoint0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBreakpoint0020 begin');
      expect(sut.GetValue('lg')).assertEqual(LG);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sut.GetValue('sm')), String(SM));
      expect(sut.GetValue('sm')).assertEqual(SM);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sut.GetValue('md')), String(MD));
      expect(sut.GetValue('md')).assertEqual(MD);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'after lg=%{public}s', String(sut.GetValue('lg')));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBreakpoint0020 end');
    });

    /**
     * @tc.number SUB_MC_BP_0021
     * @tc.name testBreakpoint0021
     * @tc.desc 状态：直接改写公有字段后 GetValue 反映新值
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('testBreakpoint0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBreakpoint0021 begin');
      sut.sm = 999;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'sm after mutate=%{public}s', String(sut.GetValue('sm')));
      expect(sut.GetValue('sm')).assertEqual(999);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sut.GetValue('md')), String(MD));
      expect(sut.GetValue('md')).assertEqual(MD);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertFalse', String(sut.GetValue('sm') === SM));
      expect(sut.GetValue('sm') === SM).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBreakpoint0021 end');
    });

    /**
     * @tc.number SUB_MC_BP_0022
     * @tc.name testBreakpoint0022
     * @tc.desc 状态：新实例独立，互不共享字段
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('testBreakpoint0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBreakpoint0022 begin');
      const other = new BreakpointType<number>(11, 22, 33);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'other.sm=%{public}s sut.sm=%{public}s',
        String(other.GetValue('sm')), String(sut.GetValue('sm')));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(other.GetValue('sm')), String(11));
      expect(other.GetValue('sm')).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(other.GetValue('lg')), String(33));
      expect(other.GetValue('lg')).assertEqual(33);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sut.GetValue('sm')), String(SM));
      expect(sut.GetValue('sm')).assertEqual(SM);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBreakpoint0022 end');
    });

    /**
     * @tc.number SUB_MC_BP_0023
     * @tc.name testBreakpoint0023
     * @tc.desc 状态：字段值为 0（falsy）时 'sm' 返回 0 而非 undefined
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL1
     */
    it('testBreakpoint0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBreakpoint0023 begin');
      const zeroSut = new BreakpointType<number>(0, 5, 6);
      const actual = zeroSut.GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(actual));
      expect(actual).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertFalse', String(actual === undefined));
      expect(actual === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(zeroSut.GetValue('md')), String(5));
      expect(zeroSut.GetValue('md')).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBreakpoint0023 end');
    });

    /**
     * @tc.number SUB_MC_BP_0024
     * @tc.name testBreakpoint0024
     * @tc.desc 状态：字段值为空串（falsy）时 'md' 返回 '' 而非 undefined
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL1
     */
    it('testBreakpoint0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBreakpoint0024 begin');
      const emptySut = new BreakpointType<string>('', 'x', 'y');
      const actual = emptySut.GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'md actual=[%{public}s]', actual);
      expect(actual).assertEqual('x');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(emptySut.GetValue('sm')), String(''));
      expect(emptySut.GetValue('sm')).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s',
        'assertFalse', String(emptySut.GetValue('sm') === undefined));
      expect(emptySut.GetValue('sm') === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBreakpoint0024 end');
    });

    /**
     * @tc.number SUB_MC_BP_0025
     * @tc.name testBreakpoint0025
     * @tc.desc 状态：字段值为 undefined 时命中断点也返回 undefined
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('testBreakpoint0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBreakpoint0025 begin');
      const undefSut = new BreakpointType<number | undefined>(undefined, 2, 3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'sm=%{public}s', String(undefSut.GetValue('sm')));
      expect(undefSut.GetValue('sm') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(undefSut.GetValue('md')), String(2));
      expect(undefSut.GetValue('md')).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(undefSut.GetValue('lg')), String(3));
      expect(undefSut.GetValue('lg')).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBreakpoint0025 end');
    });

    /**
     * @tc.number SUB_MC_BP_0026
     * @tc.name testBreakpoint0026
     * @tc.desc 合法值：负数与浮点字段按断点原样返回
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL1
     */
    it('testBreakpoint0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBreakpoint0026 begin');
      const numSut = new BreakpointType<number>(-1.5, 0.25, 1e6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'lg=%{public}s', String(numSut.GetValue('lg')));
      expect(numSut.GetValue('sm')).assertEqual(-1.5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(numSut.GetValue('md')), String(0.25));
      expect(numSut.GetValue('md')).assertEqual(0.25);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(numSut.GetValue('lg')), String(1000000));
      expect(numSut.GetValue('lg')).assertEqual(1000000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBreakpoint0026 end');
    });

    /**
     * @tc.number SUB_MC_BP_0027
     * @tc.name testBreakpoint0027
     * @tc.desc 极值：Number.MAX_SAFE_INTEGER 作为字段值原样返回不溢出
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('testBreakpoint0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBreakpoint0027 begin');
      const bigSut = new BreakpointType<number>(Number.MAX_SAFE_INTEGER, 0, 0);
      const actual = bigSut.GetValue('sm') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(actual));
      expect(actual).assertEqual(Number.MAX_SAFE_INTEGER);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertTrue', String(actual > 0));
      expect(actual > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertFalse', String(actual === undefined));
      expect(actual === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBreakpoint0027 end');
    });

    /**
     * @tc.number SUB_MC_BP_0028
     * @tc.name testBreakpoint0028
     * @tc.desc 非法值：含全字符集噪声输入统一返回 undefined
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('testBreakpoint0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBreakpoint0028 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'space=%{public}s', String(sut.GetValue(' ')));
      expect(sut.GetValue(' ') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s',
        'assertTrue', String(sut.GetValue('sm,md') === undefined));
      expect(sut.GetValue('sm,md') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertTrue', String(sut.GetValue('md') === MD));
      expect(sut.GetValue('md') === MD).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBreakpoint0028 end');
    });

    /**
     * @tc.number SUB_MC_BP_0029
     * @tc.name testBreakpoint0029
     * @tc.desc 合法值：源 MailBox minContentWidth 规则基线（sm=360, 其余=600）
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL1
     */
    it('testBreakpoint0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBreakpoint0029 begin');
      const minContent = new BreakpointType<number>(360, 600, 600);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'sm=%{public}s md=%{public}s',
        String(minContent.GetValue('sm')), String(minContent.GetValue('md')));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(minContent.GetValue('sm')), String(360));
      expect(minContent.GetValue('sm')).assertEqual(360);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(minContent.GetValue('md')), String(600));
      expect(minContent.GetValue('md')).assertEqual(600);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(minContent.GetValue('lg')), String(600));
      expect(minContent.GetValue('lg')).assertEqual(600);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBreakpoint0029 end');
    });

    /**
     * @tc.number SUB_MC_BP_0030
     * @tc.name testBreakpoint0030
     * @tc.desc 组合值：断点大小写/空白组合下仅精确小写命中，其余 undefined
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('testBreakpoint0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBreakpoint0030 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'lg exact=%{public}s', String(sut.GetValue('lg')));
      expect(sut.GetValue('lg')).assertEqual(LG);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertTrue', String(sut.GetValue('LG') === undefined));
      expect(sut.GetValue('LG') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertTrue', String(sut.GetValue('Lg') === undefined));
      expect(sut.GetValue('Lg') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBreakpoint0030 end');
    });
  });
}
