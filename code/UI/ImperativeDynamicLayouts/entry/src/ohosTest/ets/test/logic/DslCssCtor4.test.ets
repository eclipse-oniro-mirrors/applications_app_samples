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

import { describe, beforeEach, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { yieldToEventLoop } from '../TestEventLoop';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { DslCss } from '../model/DynamicLayoutLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ImperativeDynamicLayouts]';
const BUNDLE: string = 'ImperativeDynamicLayouts_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for new DslCss (44 cases). */
export default function dslCssCtor4Test(): void {
  describe('DslCssCtor4Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0136
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0136
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 0, "", -100, 15, -100, -100, "Hello") initialises 10 public mem...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0136 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 0, '', -100, 15, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", -...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", -...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", -...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", -...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", -...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", -...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", -...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", -...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", -...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", -...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(15);
      logInfo(`${BUNDLE}DslCssCtor_0136 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0137
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0137
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 0, "", -100, 20, -100, -100, "Hello") initialises 10 public mem...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0137 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 0, '', -100, 20, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", -...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", -...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", -...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", -...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", -...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", -...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", -...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", -...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", -...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", -...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(20);
      logInfo(`${BUNDLE}DslCssCtor_0137 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0138
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0138
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 0, "", -100, 25, -100, -100, "Hello") initialises 10 public mem...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0138 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 0, '', -100, 25, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", -...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", -...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", -...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", -...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", -...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", -...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", -...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", -...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", -...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", -...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(25);
      logInfo(`${BUNDLE}DslCssCtor_0138 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0139
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0139
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 0, "", -100, 30, -100, -100, "Hello") initialises 10 public mem...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0139 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 0, '', -100, 30, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", -...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", -...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", -...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", -...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", -...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", -...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", -...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", -...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", -...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", -...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(30);
      logInfo(`${BUNDLE}DslCssCtor_0139 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0140
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0140
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 0, "", -100, 35, -100, -100, "Hello") initialises 10 public mem...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0140 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 0, '', -100, 35, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", -...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", -...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", -...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", -...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", -...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", -...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", -...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", -...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", -...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", -...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(35);
      logInfo(`${BUNDLE}DslCssCtor_0140 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0141
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0141
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 0, "", -100, 25.66, -100, -100, "Hello") initialises 10 public ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0141 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 0, '', -100, 25.66, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", -...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", -...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", -...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", -...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", -...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", -...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", -...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", -...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", -...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", -...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertClose(25.66, PRECISION);
      logInfo(`${BUNDLE}DslCssCtor_0141 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0142
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0142
     * @tc.desc      new DslCss("a_1", "a_1", 30, "123", "abc_1", 991, -13, "abcabc", 10, 10, 1, 20, "Hello World") i...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0142 begin`);
      const subject: DslCss = new DslCss('a_1', 'a_1', 30, '123', 'abc_1', 991, -13, 'abcabc', 10, 10, 1, 20,
        'Hello World');
      logInfo(`new DslCss("a_1", "a_1", 30, "123", "abc_...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('a_1');
      logInfo(`new DslCss("a_1", "a_1", 30, "123", "abc_...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('a_1');
      logInfo(`new DslCss("a_1", "a_1", 30, "123", "abc_...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(30);
      logInfo(`new DslCss("a_1", "a_1", 30, "123", "abc_...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('123');
      logInfo(`new DslCss("a_1", "a_1", 30, "123", "abc_...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('abc_1');
      logInfo(`new DslCss("a_1", "a_1", 30, "123", "abc_...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(991);
      logInfo(`new DslCss("a_1", "a_1", 30, "123", "abc_...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(-13);
      logInfo(`new DslCss("a_1", "a_1", 30, "123", "abc_...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('abcabc');
      logInfo(`new DslCss("a_1", "a_1", 30, "123", "abc_...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(10);
      logInfo(`new DslCss("a_1", "a_1", 30, "123", "abc_...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(10);
      logInfo(`${BUNDLE}DslCssCtor_0142 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0143
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0143
     * @tc.desc      new DslCss("123", "abc_1", 2, "123", "a", 1, 1.5, "", 100, -100, 20, 0, "HelloHello") initialise...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0143 begin`);
      const subject: DslCss = new DslCss('123', 'abc_1', 2, '123', 'a', 1, 1.5, '', 100, -100, 20, 0, 'HelloHello');
      logInfo(`new DslCss("123", "abc_1", 2, "123", "a",...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('123');
      logInfo(`new DslCss("123", "abc_1", 2, "123", "a",...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('abc_1');
      logInfo(`new DslCss("123", "abc_1", 2, "123", "a",...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(2);
      logInfo(`new DslCss("123", "abc_1", 2, "123", "a",...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('123');
      logInfo(`new DslCss("123", "abc_1", 2, "123", "a",...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('a');
      logInfo(`new DslCss("123", "abc_1", 2, "123", "a",...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(1);
      logInfo(`new DslCss("123", "abc_1", 2, "123", "a",...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertClose(1.5, PRECISION);
      logInfo(`new DslCss("123", "abc_1", 2, "123", "a",...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("123", "abc_1", 2, "123", "a",...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(100);
      logInfo(`new DslCss("123", "abc_1", 2, "123", "a",...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0143 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0144
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0144
     * @tc.desc      new DslCss("a", "aa", -73, "", " abc ", 991, 0, "abc_1", 2, -1, 50, 35, " ") initialises 10 publ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0144 begin`);
      const subject: DslCss = new DslCss('a', 'aa', -73, '', ' abc ', 991, 0, 'abc_1', 2, -1, 50, 35, ' ');
      logInfo(`new DslCss("a", "aa", -73, "", " abc ", 9...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('a');
      logInfo(`new DslCss("a", "aa", -73, "", " abc ", 9...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('aa');
      logInfo(`new DslCss("a", "aa", -73, "", " abc ", 9...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(-73);
      logInfo(`new DslCss("a", "aa", -73, "", " abc ", 9...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("a", "aa", -73, "", " abc ", 9...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual(' abc ');
      logInfo(`new DslCss("a", "aa", -73, "", " abc ", 9...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(991);
      logInfo(`new DslCss("a", "aa", -73, "", " abc ", 9...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("a", "aa", -73, "", " abc ", 9...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('abc_1');
      logInfo(`new DslCss("a", "aa", -73, "", " abc ", 9...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(2);
      logInfo(`new DslCss("a", "aa", -73, "", " abc ", 9...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-1);
      logInfo(`${BUNDLE}DslCssCtor_0144 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0145
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0145
     * @tc.desc      new DslCss("xa", "abcabc", 5, " a ", " abc ", 100, 1.5, "abc", 20, 0, -1, 1, "Hello World") init...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0145 begin`);
      const subject: DslCss = new DslCss('xa', 'abcabc', 5, ' a ', ' abc ', 100, 1.5, 'abc', 20, 0, -1, 1,
        'Hello World');
      logInfo(`new DslCss("xa", "abcabc", 5, " a ", " ab...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('xa');
      logInfo(`new DslCss("xa", "abcabc", 5, " a ", " ab...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('abcabc');
      logInfo(`new DslCss("xa", "abcabc", 5, " a ", " ab...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(5);
      logInfo(`new DslCss("xa", "abcabc", 5, " a ", " ab...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual(' a ');
      logInfo(`new DslCss("xa", "abcabc", 5, " a ", " ab...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual(' abc ');
      logInfo(`new DslCss("xa", "abcabc", 5, " a ", " ab...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(100);
      logInfo(`new DslCss("xa", "abcabc", 5, " a ", " ab...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertClose(1.5, PRECISION);
      logInfo(`new DslCss("xa", "abcabc", 5, " a ", " ab...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('abc');
      logInfo(`new DslCss("xa", "abcabc", 5, " a ", " ab...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(20);
      logInfo(`new DslCss("xa", "abcabc", 5, " a ", " ab...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(0);
      logInfo(`${BUNDLE}DslCssCtor_0145 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0146
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0146
     * @tc.desc      new DslCss("Hello World", "xabc", 51, " ", "xa", 401, 2, "xa", 50, 100, 30, 20, "123") initialis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0146 begin`);
      const subject: DslCss = new DslCss('Hello World', 'xabc', 51, ' ', 'xa', 401, 2, 'xa', 50, 100, 30, 20, '123');
      logInfo(`new DslCss("Hello World", "xabc", 51, " "...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('Hello World');
      logInfo(`new DslCss("Hello World", "xabc", 51, " "...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('xabc');
      logInfo(`new DslCss("Hello World", "xabc", 51, " "...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(51);
      logInfo(`new DslCss("Hello World", "xabc", 51, " "...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual(' ');
      logInfo(`new DslCss("Hello World", "xabc", 51, " "...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('xa');
      logInfo(`new DslCss("Hello World", "xabc", 51, " "...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(401);
      logInfo(`new DslCss("Hello World", "xabc", 51, " "...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(2);
      logInfo(`new DslCss("Hello World", "xabc", 51, " "...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('xa');
      logInfo(`new DslCss("Hello World", "xabc", 51, " "...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(50);
      logInfo(`new DslCss("Hello World", "xabc", 51, " "...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(100);
      logInfo(`${BUNDLE}DslCssCtor_0146 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0147
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0147
     * @tc.desc      new DslCss("xa", "a", 5, " a ", "a_1", 404, 0, " a ", 100, -100, 35, 2, "A") initialises 10 publ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0147 begin`);
      const subject: DslCss = new DslCss('xa', 'a', 5, ' a ', 'a_1', 404, 0, ' a ', 100, -100, 35, 2, 'A');
      logInfo(`new DslCss("xa", "a", 5, " a ", "a_1", 40...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('xa');
      logInfo(`new DslCss("xa", "a", 5, " a ", "a_1", 40...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('a');
      logInfo(`new DslCss("xa", "a", 5, " a ", "a_1", 40...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(5);
      logInfo(`new DslCss("xa", "a", 5, " a ", "a_1", 40...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual(' a ');
      logInfo(`new DslCss("xa", "a", 5, " a ", "a_1", 40...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('a_1');
      logInfo(`new DslCss("xa", "a", 5, " a ", "a_1", 40...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(404);
      logInfo(`new DslCss("xa", "a", 5, " a ", "a_1", 40...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("xa", "a", 5, " a ", "a_1", 40...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual(' a ');
      logInfo(`new DslCss("xa", "a", 5, " a ", "a_1", 40...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(100);
      logInfo(`new DslCss("xa", "a", 5, " a ", "a_1", 40...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0147 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0148
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0148
     * @tc.desc      new DslCss("a_1", " ", 10, "abc", "a", 2, 10, "abc_1", 50, 25, 50, 145, " ") initialises 10 publ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0148 begin`);
      const subject: DslCss = new DslCss('a_1', ' ', 10, 'abc', 'a', 2, 10, 'abc_1', 50, 25, 50, 145, ' ');
      logInfo(`new DslCss("a_1", " ", 10, "abc", "a", 2,...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('a_1');
      logInfo(`new DslCss("a_1", " ", 10, "abc", "a", 2,...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual(' ');
      logInfo(`new DslCss("a_1", " ", 10, "abc", "a", 2,...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(10);
      logInfo(`new DslCss("a_1", " ", 10, "abc", "a", 2,...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('abc');
      logInfo(`new DslCss("a_1", " ", 10, "abc", "a", 2,...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('a');
      logInfo(`new DslCss("a_1", " ", 10, "abc", "a", 2,...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(2);
      logInfo(`new DslCss("a_1", " ", 10, "abc", "a", 2,...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(10);
      logInfo(`new DslCss("a_1", " ", 10, "abc", "a", 2,...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('abc_1');
      logInfo(`new DslCss("a_1", " ", 10, "abc", "a", 2,...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(50);
      logInfo(`new DslCss("a_1", " ", 10, "abc", "a", 2,...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(25);
      logInfo(`${BUNDLE}DslCssCtor_0148 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0149
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0149
     * @tc.desc      new DslCss(" a ", "123", 2, "aa", "a_1", 10, -1, "", 1, 1, 0, 100, "HelloHello") initialises 10 ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0149 begin`);
      const subject: DslCss = new DslCss(' a ', '123', 2, 'aa', 'a_1', 10, -1, '', 1, 1, 0, 100, 'HelloHello');
      logInfo(`new DslCss(" a ", "123", 2, "aa", "a_1", ...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual(' a ');
      logInfo(`new DslCss(" a ", "123", 2, "aa", "a_1", ...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('123');
      logInfo(`new DslCss(" a ", "123", 2, "aa", "a_1", ...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(2);
      logInfo(`new DslCss(" a ", "123", 2, "aa", "a_1", ...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('aa');
      logInfo(`new DslCss(" a ", "123", 2, "aa", "a_1", ...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('a_1');
      logInfo(`new DslCss(" a ", "123", 2, "aa", "a_1", ...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(10);
      logInfo(`new DslCss(" a ", "123", 2, "aa", "a_1", ...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(-1);
      logInfo(`new DslCss(" a ", "123", 2, "aa", "a_1", ...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss(" a ", "123", 2, "aa", "a_1", ...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(1);
      logInfo(`new DslCss(" a ", "123", 2, "aa", "a_1", ...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(1);
      logInfo(`${BUNDLE}DslCssCtor_0149 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0150
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0150
     * @tc.desc      new DslCss(" abc ", "123", 35, " a ", "abcabc", 401, 15, " a ", -1, 10, 15, 3, "Hello") initiali...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0150 begin`);
      const subject: DslCss = new DslCss(' abc ', '123', 35, ' a ', 'abcabc', 401, 15, ' a ', -1, 10, 15, 3, 'Hello');
      logInfo(`new DslCss(" abc ", "123", 35, " a ", "ab...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual(' abc ');
      logInfo(`new DslCss(" abc ", "123", 35, " a ", "ab...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('123');
      logInfo(`new DslCss(" abc ", "123", 35, " a ", "ab...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(35);
      logInfo(`new DslCss(" abc ", "123", 35, " a ", "ab...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual(' a ');
      logInfo(`new DslCss(" abc ", "123", 35, " a ", "ab...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('abcabc');
      logInfo(`new DslCss(" abc ", "123", 35, " a ", "ab...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(401);
      logInfo(`new DslCss(" abc ", "123", 35, " a ", "ab...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(15);
      logInfo(`new DslCss(" abc ", "123", 35, " a ", "ab...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual(' a ');
      logInfo(`new DslCss(" abc ", "123", 35, " a ", "ab...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-1);
      logInfo(`new DslCss(" abc ", "123", 35, " a ", "ab...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(10);
      logInfo(`${BUNDLE}DslCssCtor_0150 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0151
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0151
     * @tc.desc      new DslCss("xa", "", 20, "abc", " a ", 200, 0.25, "abc_1", 3, 10, 2, 15, "a") initialises 10 pub...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0151 begin`);
      const subject: DslCss = new DslCss('xa', '', 20, 'abc', ' a ', 200, 0.25, 'abc_1', 3, 10, 2, 15, 'a');
      logInfo(`new DslCss("xa", "", 20, "abc", " a ", 20...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('xa');
      logInfo(`new DslCss("xa", "", 20, "abc", " a ", 20...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("xa", "", 20, "abc", " a ", 20...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(20);
      logInfo(`new DslCss("xa", "", 20, "abc", " a ", 20...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('abc');
      logInfo(`new DslCss("xa", "", 20, "abc", " a ", 20...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual(' a ');
      logInfo(`new DslCss("xa", "", 20, "abc", " a ", 20...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(200);
      logInfo(`new DslCss("xa", "", 20, "abc", " a ", 20...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertClose(0.25, PRECISION);
      logInfo(`new DslCss("xa", "", 20, "abc", " a ", 20...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('abc_1');
      logInfo(`new DslCss("xa", "", 20, "abc", " a ", 20...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(3);
      logInfo(`new DslCss("xa", "", 20, "abc", " a ", 20...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(10);
      logInfo(`${BUNDLE}DslCssCtor_0151 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0152
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0152
     * @tc.desc      new DslCss("123", "a_1", 35, "123", " ", 1, 0.25, "a", 2, 10, 0, -100, "Sample Title 123") initi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0152 begin`);
      const subject: DslCss = new DslCss('123', 'a_1', 35, '123', ' ', 1, 0.25, 'a', 2, 10, 0, -100,
        'Sample Title 123');
      logInfo(`new DslCss("123", "a_1", 35, "123", " ", ...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('123');
      logInfo(`new DslCss("123", "a_1", 35, "123", " ", ...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('a_1');
      logInfo(`new DslCss("123", "a_1", 35, "123", " ", ...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(35);
      logInfo(`new DslCss("123", "a_1", 35, "123", " ", ...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('123');
      logInfo(`new DslCss("123", "a_1", 35, "123", " ", ...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual(' ');
      logInfo(`new DslCss("123", "a_1", 35, "123", " ", ...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(1);
      logInfo(`new DslCss("123", "a_1", 35, "123", " ", ...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertClose(0.25, PRECISION);
      logInfo(`new DslCss("123", "a_1", 35, "123", " ", ...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('a');
      logInfo(`new DslCss("123", "a_1", 35, "123", " ", ...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(2);
      logInfo(`new DslCss("123", "a_1", 35, "123", " ", ...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(10);
      logInfo(`${BUNDLE}DslCssCtor_0152 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0153
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0153
     * @tc.desc      new DslCss("123", "abc", 2, " ", "xabc", 3, 0.25, "xa", 1, 100, 78.2, 0, "abc") initialises 10 p...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0153 begin`);
      const subject: DslCss = new DslCss('123', 'abc', 2, ' ', 'xabc', 3, 0.25, 'xa', 1, 100, 78.2, 0, 'abc');
      logInfo(`new DslCss("123", "abc", 2, " ", "xabc", ...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('123');
      logInfo(`new DslCss("123", "abc", 2, " ", "xabc", ...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('abc');
      logInfo(`new DslCss("123", "abc", 2, " ", "xabc", ...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(2);
      logInfo(`new DslCss("123", "abc", 2, " ", "xabc", ...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual(' ');
      logInfo(`new DslCss("123", "abc", 2, " ", "xabc", ...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('xabc');
      logInfo(`new DslCss("123", "abc", 2, " ", "xabc", ...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(3);
      logInfo(`new DslCss("123", "abc", 2, " ", "xabc", ...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertClose(0.25, PRECISION);
      logInfo(`new DslCss("123", "abc", 2, " ", "xabc", ...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('xa');
      logInfo(`new DslCss("123", "abc", 2, " ", "xabc", ...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(1);
      logInfo(`new DslCss("123", "abc", 2, " ", "xabc", ...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(100);
      logInfo(`${BUNDLE}DslCssCtor_0153 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0154
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0154
     * @tc.desc      new DslCss("", "123", 20, " abc ", "abc_1", 25, 30, "a_1", 1, 30, 78.2, 10, "Hello_1") initialis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0154 begin`);
      const subject: DslCss = new DslCss('', '123', 20, ' abc ', 'abc_1', 25, 30, 'a_1', 1, 30, 78.2, 10, 'Hello_1');
      logInfo(`new DslCss("", "123", 20, " abc ", "abc_1...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "123", 20, " abc ", "abc_1...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('123');
      logInfo(`new DslCss("", "123", 20, " abc ", "abc_1...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(20);
      logInfo(`new DslCss("", "123", 20, " abc ", "abc_1...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual(' abc ');
      logInfo(`new DslCss("", "123", 20, " abc ", "abc_1...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('abc_1');
      logInfo(`new DslCss("", "123", 20, " abc ", "abc_1...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(25);
      logInfo(`new DslCss("", "123", 20, " abc ", "abc_1...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(30);
      logInfo(`new DslCss("", "123", 20, " abc ", "abc_1...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('a_1');
      logInfo(`new DslCss("", "123", 20, " abc ", "abc_1...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(1);
      logInfo(`new DslCss("", "123", 20, " abc ", "abc_1...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(30);
      logInfo(`${BUNDLE}DslCssCtor_0154 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0155
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0155
     * @tc.desc      new DslCss("aa", " abc ", 40, "a_1", "abc", 3, -1, "123", 0, 25, -100, 100, "hello world") initi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0155 begin`);
      const subject: DslCss = new DslCss('aa', ' abc ', 40, 'a_1', 'abc', 3, -1, '123', 0, 25, -100, 100,
        'hello world');
      logInfo(`new DslCss("aa", " abc ", 40, "a_1", "abc...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('aa');
      logInfo(`new DslCss("aa", " abc ", 40, "a_1", "abc...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual(' abc ');
      logInfo(`new DslCss("aa", " abc ", 40, "a_1", "abc...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(40);
      logInfo(`new DslCss("aa", " abc ", 40, "a_1", "abc...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('a_1');
      logInfo(`new DslCss("aa", " abc ", 40, "a_1", "abc...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('abc');
      logInfo(`new DslCss("aa", " abc ", 40, "a_1", "abc...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(3);
      logInfo(`new DslCss("aa", " abc ", 40, "a_1", "abc...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(-1);
      logInfo(`new DslCss("aa", " abc ", 40, "a_1", "abc...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('123');
      logInfo(`new DslCss("aa", " abc ", 40, "a_1", "abc...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(0);
      logInfo(`new DslCss("aa", " abc ", 40, "a_1", "abc...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(25);
      logInfo(`${BUNDLE}DslCssCtor_0155 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0156
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0156
     * @tc.desc      new DslCss(" ", "123", 2, " a ", "xa", 100, 30, "a_1", 50, 100, 78.2, 30, "Sample Title 123") in...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0156 begin`);
      const subject: DslCss = new DslCss(' ', '123', 2, ' a ', 'xa', 100, 30, 'a_1', 50, 100, 78.2, 30,
        'Sample Title 123');
      logInfo(`new DslCss(" ", "123", 2, " a ", "xa", 10...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual(' ');
      logInfo(`new DslCss(" ", "123", 2, " a ", "xa", 10...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('123');
      logInfo(`new DslCss(" ", "123", 2, " a ", "xa", 10...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(2);
      logInfo(`new DslCss(" ", "123", 2, " a ", "xa", 10...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual(' a ');
      logInfo(`new DslCss(" ", "123", 2, " a ", "xa", 10...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('xa');
      logInfo(`new DslCss(" ", "123", 2, " a ", "xa", 10...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(100);
      logInfo(`new DslCss(" ", "123", 2, " a ", "xa", 10...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(30);
      logInfo(`new DslCss(" ", "123", 2, " a ", "xa", 10...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('a_1');
      logInfo(`new DslCss(" ", "123", 2, " a ", "xa", 10...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(50);
      logInfo(`new DslCss(" ", "123", 2, " a ", "xa", 10...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(100);
      logInfo(`${BUNDLE}DslCssCtor_0156 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0157
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0157
     * @tc.desc      new DslCss(" a ", "Hello World", 35, " ", "a", 0, 5, "", 30, 1, 1, 2, "Hello World") initialises...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0157 begin`);
      const subject: DslCss = new DslCss(' a ', 'Hello World', 35, ' ', 'a', 0, 5, '', 30, 1, 1, 2, 'Hello World');
      logInfo(`new DslCss(" a ", "Hello World", 35, " ",...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual(' a ');
      logInfo(`new DslCss(" a ", "Hello World", 35, " ",...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('Hello World');
      logInfo(`new DslCss(" a ", "Hello World", 35, " ",...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(35);
      logInfo(`new DslCss(" a ", "Hello World", 35, " ",...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual(' ');
      logInfo(`new DslCss(" a ", "Hello World", 35, " ",...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('a');
      logInfo(`new DslCss(" a ", "Hello World", 35, " ",...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss(" a ", "Hello World", 35, " ",...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(5);
      logInfo(`new DslCss(" a ", "Hello World", 35, " ",...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss(" a ", "Hello World", 35, " ",...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(30);
      logInfo(`new DslCss(" a ", "Hello World", 35, " ",...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(1);
      logInfo(`${BUNDLE}DslCssCtor_0157 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0158
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0158
     * @tc.desc      new DslCss("abcabc", "abc", 35, " abc ", "abc", 50, 1.5, " a ", 30, 20, 100, 15, "hello world") ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0158 begin`);
      const subject: DslCss = new DslCss('abcabc', 'abc', 35, ' abc ', 'abc', 50, 1.5, ' a ', 30, 20, 100, 15,
        'hello world');
      logInfo(`new DslCss("abcabc", "abc", 35, " abc ", ...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('abcabc');
      logInfo(`new DslCss("abcabc", "abc", 35, " abc ", ...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('abc');
      logInfo(`new DslCss("abcabc", "abc", 35, " abc ", ...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(35);
      logInfo(`new DslCss("abcabc", "abc", 35, " abc ", ...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual(' abc ');
      logInfo(`new DslCss("abcabc", "abc", 35, " abc ", ...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('abc');
      logInfo(`new DslCss("abcabc", "abc", 35, " abc ", ...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(50);
      logInfo(`new DslCss("abcabc", "abc", 35, " abc ", ...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertClose(1.5, PRECISION);
      logInfo(`new DslCss("abcabc", "abc", 35, " abc ", ...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual(' a ');
      logInfo(`new DslCss("abcabc", "abc", 35, " abc ", ...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(30);
      logInfo(`new DslCss("abcabc", "abc", 35, " abc ", ...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(20);
      logInfo(`${BUNDLE}DslCssCtor_0158 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0159
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0159
     * @tc.desc      new DslCss("abcabc", " ", 15, "Hello World", "xabc", 50, 0.25, "abc_1", 25, 30, 30, 50, "HelloHe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0159 begin`);
      const subject: DslCss = new DslCss('abcabc', ' ', 15, 'Hello World', 'xabc', 50, 0.25, 'abc_1', 25, 30, 30, 50,
        'HelloHello');
      logInfo(`new DslCss("abcabc", " ", 15, "Hello Worl...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('abcabc');
      logInfo(`new DslCss("abcabc", " ", 15, "Hello Worl...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual(' ');
      logInfo(`new DslCss("abcabc", " ", 15, "Hello Worl...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(15);
      logInfo(`new DslCss("abcabc", " ", 15, "Hello Worl...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('Hello World');
      logInfo(`new DslCss("abcabc", " ", 15, "Hello Worl...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('xabc');
      logInfo(`new DslCss("abcabc", " ", 15, "Hello Worl...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(50);
      logInfo(`new DslCss("abcabc", " ", 15, "Hello Worl...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertClose(0.25, PRECISION);
      logInfo(`new DslCss("abcabc", " ", 15, "Hello Worl...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('abc_1');
      logInfo(`new DslCss("abcabc", " ", 15, "Hello Worl...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(25);
      logInfo(`new DslCss("abcabc", " ", 15, "Hello Worl...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(30);
      logInfo(`${BUNDLE}DslCssCtor_0159 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0160
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0160
     * @tc.desc      new DslCss("xabc", "abc_1", 3, "aa", "Hello World", 2, 30, "aa", 100, 50, -100, 25, " Hello ") i...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0160 begin`);
      const subject: DslCss = new DslCss('xabc', 'abc_1', 3, 'aa', 'Hello World', 2, 30, 'aa', 100, 50, -100, 25,
        ' Hello ');
      logInfo(`new DslCss("xabc", "abc_1", 3, "aa", "Hel...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('xabc');
      logInfo(`new DslCss("xabc", "abc_1", 3, "aa", "Hel...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('abc_1');
      logInfo(`new DslCss("xabc", "abc_1", 3, "aa", "Hel...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(3);
      logInfo(`new DslCss("xabc", "abc_1", 3, "aa", "Hel...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('aa');
      logInfo(`new DslCss("xabc", "abc_1", 3, "aa", "Hel...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('Hello World');
      logInfo(`new DslCss("xabc", "abc_1", 3, "aa", "Hel...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(2);
      logInfo(`new DslCss("xabc", "abc_1", 3, "aa", "Hel...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(30);
      logInfo(`new DslCss("xabc", "abc_1", 3, "aa", "Hel...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('aa');
      logInfo(`new DslCss("xabc", "abc_1", 3, "aa", "Hel...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(100);
      logInfo(`new DslCss("xabc", "abc_1", 3, "aa", "Hel...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(50);
      logInfo(`${BUNDLE}DslCssCtor_0160 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0161
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0161
     * @tc.desc      new DslCss("a", "abc_1", 15, "abc_1", "123", 3, 0, "Hello World", 20, -100, 1, -100, "Sample Tit...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0161 begin`);
      const subject: DslCss = new DslCss('a', 'abc_1', 15, 'abc_1', '123', 3, 0, 'Hello World', 20, -100, 1, -100,
        'Sample Title 123');
      logInfo(`new DslCss("a", "abc_1", 15, "abc_1", "12...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('a');
      logInfo(`new DslCss("a", "abc_1", 15, "abc_1", "12...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('abc_1');
      logInfo(`new DslCss("a", "abc_1", 15, "abc_1", "12...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(15);
      logInfo(`new DslCss("a", "abc_1", 15, "abc_1", "12...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('abc_1');
      logInfo(`new DslCss("a", "abc_1", 15, "abc_1", "12...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('123');
      logInfo(`new DslCss("a", "abc_1", 15, "abc_1", "12...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(3);
      logInfo(`new DslCss("a", "abc_1", 15, "abc_1", "12...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("a", "abc_1", 15, "abc_1", "12...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('Hello World');
      logInfo(`new DslCss("a", "abc_1", 15, "abc_1", "12...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(20);
      logInfo(`new DslCss("a", "abc_1", 15, "abc_1", "12...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0161 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0162
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0162
     * @tc.desc      new DslCss("", "a_1", 25, "aa", "abc_1", 404, -1, " abc ", 1, 15, 20, 145, "Hello_1") initialise...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0162 begin`);
      const subject: DslCss = new DslCss('', 'a_1', 25, 'aa', 'abc_1', 404, -1, ' abc ', 1, 15, 20, 145, 'Hello_1');
      logInfo(`new DslCss("", "a_1", 25, "aa", "abc_1", ...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "a_1", 25, "aa", "abc_1", ...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('a_1');
      logInfo(`new DslCss("", "a_1", 25, "aa", "abc_1", ...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(25);
      logInfo(`new DslCss("", "a_1", 25, "aa", "abc_1", ...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('aa');
      logInfo(`new DslCss("", "a_1", 25, "aa", "abc_1", ...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('abc_1');
      logInfo(`new DslCss("", "a_1", 25, "aa", "abc_1", ...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(404);
      logInfo(`new DslCss("", "a_1", 25, "aa", "abc_1", ...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(-1);
      logInfo(`new DslCss("", "a_1", 25, "aa", "abc_1", ...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual(' abc ');
      logInfo(`new DslCss("", "a_1", 25, "aa", "abc_1", ...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(1);
      logInfo(`new DslCss("", "a_1", 25, "aa", "abc_1", ...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(15);
      logInfo(`${BUNDLE}DslCssCtor_0162 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0163
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0163
     * @tc.desc      new DslCss("aa", "abcabc", 2, "abc_1", "abc_1", 2, -13, " ", 10, -1, 30, 5, "Hello World") initi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0163 begin`);
      const subject: DslCss = new DslCss('aa', 'abcabc', 2, 'abc_1', 'abc_1', 2, -13, ' ', 10, -1, 30, 5,
        'Hello World');
      logInfo(`new DslCss("aa", "abcabc", 2, "abc_1", "a...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('aa');
      logInfo(`new DslCss("aa", "abcabc", 2, "abc_1", "a...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('abcabc');
      logInfo(`new DslCss("aa", "abcabc", 2, "abc_1", "a...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(2);
      logInfo(`new DslCss("aa", "abcabc", 2, "abc_1", "a...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('abc_1');
      logInfo(`new DslCss("aa", "abcabc", 2, "abc_1", "a...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('abc_1');
      logInfo(`new DslCss("aa", "abcabc", 2, "abc_1", "a...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(2);
      logInfo(`new DslCss("aa", "abcabc", 2, "abc_1", "a...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(-13);
      logInfo(`new DslCss("aa", "abcabc", 2, "abc_1", "a...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual(' ');
      logInfo(`new DslCss("aa", "abcabc", 2, "abc_1", "a...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(10);
      logInfo(`new DslCss("aa", "abcabc", 2, "abc_1", "a...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-1);
      logInfo(`${BUNDLE}DslCssCtor_0163 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0164
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0164
     * @tc.desc      new DslCss("xa", "a", 3, "a", " a ", 500, 20, "a_1", 20, 30, 0, 0, "Hello World") initialises 10...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0164 begin`);
      const subject: DslCss = new DslCss('xa', 'a', 3, 'a', ' a ', 500, 20, 'a_1', 20, 30, 0, 0, 'Hello World');
      logInfo(`new DslCss("xa", "a", 3, "a", " a ", 500,...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('xa');
      logInfo(`new DslCss("xa", "a", 3, "a", " a ", 500,...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('a');
      logInfo(`new DslCss("xa", "a", 3, "a", " a ", 500,...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(3);
      logInfo(`new DslCss("xa", "a", 3, "a", " a ", 500,...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('a');
      logInfo(`new DslCss("xa", "a", 3, "a", " a ", 500,...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual(' a ');
      logInfo(`new DslCss("xa", "a", 3, "a", " a ", 500,...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(500);
      logInfo(`new DslCss("xa", "a", 3, "a", " a ", 500,...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(20);
      logInfo(`new DslCss("xa", "a", 3, "a", " a ", 500,...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('a_1');
      logInfo(`new DslCss("xa", "a", 3, "a", " a ", 500,...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(20);
      logInfo(`new DslCss("xa", "a", 3, "a", " a ", 500,...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(30);
      logInfo(`${BUNDLE}DslCssCtor_0164 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0165
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0165
     * @tc.desc      new DslCss("abc_1", " abc ", 20, "", "a", 1, 1.5, "abc", 20, 2, 2, 1, "Hello World") initialises...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0165 begin`);
      const subject: DslCss = new DslCss('abc_1', ' abc ', 20, '', 'a', 1, 1.5, 'abc', 20, 2, 2, 1, 'Hello World');
      logInfo(`new DslCss("abc_1", " abc ", 20, "", "a",...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('abc_1');
      logInfo(`new DslCss("abc_1", " abc ", 20, "", "a",...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual(' abc ');
      logInfo(`new DslCss("abc_1", " abc ", 20, "", "a",...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(20);
      logInfo(`new DslCss("abc_1", " abc ", 20, "", "a",...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("abc_1", " abc ", 20, "", "a",...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('a');
      logInfo(`new DslCss("abc_1", " abc ", 20, "", "a",...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(1);
      logInfo(`new DslCss("abc_1", " abc ", 20, "", "a",...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertClose(1.5, PRECISION);
      logInfo(`new DslCss("abc_1", " abc ", 20, "", "a",...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('abc');
      logInfo(`new DslCss("abc_1", " abc ", 20, "", "a",...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(20);
      logInfo(`new DslCss("abc_1", " abc ", 20, "", "a",...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(2);
      logInfo(`${BUNDLE}DslCssCtor_0165 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0166
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0166
     * @tc.desc      new DslCss("a", "abc_1", 3, "abc", " ", 125, 20, "xabc", 20, 2, 50, 0, "123") initialises 10 pub...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0166 begin`);
      const subject: DslCss = new DslCss('a', 'abc_1', 3, 'abc', ' ', 125, 20, 'xabc', 20, 2, 50, 0, '123');
      logInfo(`new DslCss("a", "abc_1", 3, "abc", " ", 1...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('a');
      logInfo(`new DslCss("a", "abc_1", 3, "abc", " ", 1...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('abc_1');
      logInfo(`new DslCss("a", "abc_1", 3, "abc", " ", 1...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(3);
      logInfo(`new DslCss("a", "abc_1", 3, "abc", " ", 1...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('abc');
      logInfo(`new DslCss("a", "abc_1", 3, "abc", " ", 1...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual(' ');
      logInfo(`new DslCss("a", "abc_1", 3, "abc", " ", 1...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(125);
      logInfo(`new DslCss("a", "abc_1", 3, "abc", " ", 1...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(20);
      logInfo(`new DslCss("a", "abc_1", 3, "abc", " ", 1...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('xabc');
      logInfo(`new DslCss("a", "abc_1", 3, "abc", " ", 1...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(20);
      logInfo(`new DslCss("a", "abc_1", 3, "abc", " ", 1...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(2);
      logInfo(`${BUNDLE}DslCssCtor_0166 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0167
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0167
     * @tc.desc      new DslCss("Hello World", "aa", 40, " abc ", "Hello World", 0, 1, "abc_1", 2, 35, 50, 20, "??") ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0167 begin`);
      const subject: DslCss = new DslCss('Hello World', 'aa', 40, ' abc ', 'Hello World', 0, 1, 'abc_1', 2, 35, 50, 20,
        '\u4e2d\u6587');
      logInfo(`new DslCss("Hello World", "aa", 40, " abc...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('Hello World');
      logInfo(`new DslCss("Hello World", "aa", 40, " abc...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('aa');
      logInfo(`new DslCss("Hello World", "aa", 40, " abc...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(40);
      logInfo(`new DslCss("Hello World", "aa", 40, " abc...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual(' abc ');
      logInfo(`new DslCss("Hello World", "aa", 40, " abc...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('Hello World');
      logInfo(`new DslCss("Hello World", "aa", 40, " abc...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("Hello World", "aa", 40, " abc...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(1);
      logInfo(`new DslCss("Hello World", "aa", 40, " abc...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('abc_1');
      logInfo(`new DslCss("Hello World", "aa", 40, " abc...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(2);
      logInfo(`new DslCss("Hello World", "aa", 40, " abc...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(35);
      logInfo(`${BUNDLE}DslCssCtor_0167 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0168
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0168
     * @tc.desc      new DslCss("xa", " ", 5, "xabc", " abc ", 991, 10, " ", 85, 35, 78.2, 20, " Hello ") initialises...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0168 begin`);
      const subject: DslCss = new DslCss('xa', ' ', 5, 'xabc', ' abc ', 991, 10, ' ', 85, 35, 78.2, 20, ' Hello ');
      logInfo(`new DslCss("xa", " ", 5, "xabc", " abc ",...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('xa');
      logInfo(`new DslCss("xa", " ", 5, "xabc", " abc ",...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual(' ');
      logInfo(`new DslCss("xa", " ", 5, "xabc", " abc ",...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(5);
      logInfo(`new DslCss("xa", " ", 5, "xabc", " abc ",...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('xabc');
      logInfo(`new DslCss("xa", " ", 5, "xabc", " abc ",...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual(' abc ');
      logInfo(`new DslCss("xa", " ", 5, "xabc", " abc ",...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(991);
      logInfo(`new DslCss("xa", " ", 5, "xabc", " abc ",...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(10);
      logInfo(`new DslCss("xa", " ", 5, "xabc", " abc ",...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual(' ');
      logInfo(`new DslCss("xa", " ", 5, "xabc", " abc ",...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(85);
      logInfo(`new DslCss("xa", " ", 5, "xabc", " abc ",...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(35);
      logInfo(`${BUNDLE}DslCssCtor_0168 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0169
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0169
     * @tc.desc      new DslCss("123", "xa", 1, "abcabc", "xabc", 1, -13, "a_1", 10, 10, -100, 35, "??") initialises ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0169 begin`);
      const subject: DslCss = new DslCss('123', 'xa', 1, 'abcabc', 'xabc', 1, -13, 'a_1', 10, 10, -100, 35,
        '\u4e2d\u6587');
      logInfo(`new DslCss("123", "xa", 1, "abcabc", "xab...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('123');
      logInfo(`new DslCss("123", "xa", 1, "abcabc", "xab...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('xa');
      logInfo(`new DslCss("123", "xa", 1, "abcabc", "xab...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(1);
      logInfo(`new DslCss("123", "xa", 1, "abcabc", "xab...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('abcabc');
      logInfo(`new DslCss("123", "xa", 1, "abcabc", "xab...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('xabc');
      logInfo(`new DslCss("123", "xa", 1, "abcabc", "xab...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(1);
      logInfo(`new DslCss("123", "xa", 1, "abcabc", "xab...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(-13);
      logInfo(`new DslCss("123", "xa", 1, "abcabc", "xab...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('a_1');
      logInfo(`new DslCss("123", "xa", 1, "abcabc", "xab...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(10);
      logInfo(`new DslCss("123", "xa", 1, "abcabc", "xab...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(10);
      logInfo(`${BUNDLE}DslCssCtor_0169 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0170
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0170
     * @tc.desc      new DslCss(" ", "abc", 0, "a", "xa", 100, 2, "abc", 50, 25, 100, 35, "") initialises 10 public m...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0170 begin`);
      const subject: DslCss = new DslCss(' ', 'abc', 0, 'a', 'xa', 100, 2, 'abc', 50, 25, 100, 35, '');
      logInfo(`new DslCss(" ", "abc", 0, "a", "xa", 100,...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual(' ');
      logInfo(`new DslCss(" ", "abc", 0, "a", "xa", 100,...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('abc');
      logInfo(`new DslCss(" ", "abc", 0, "a", "xa", 100,...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss(" ", "abc", 0, "a", "xa", 100,...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('a');
      logInfo(`new DslCss(" ", "abc", 0, "a", "xa", 100,...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('xa');
      logInfo(`new DslCss(" ", "abc", 0, "a", "xa", 100,...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(100);
      logInfo(`new DslCss(" ", "abc", 0, "a", "xa", 100,...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(2);
      logInfo(`new DslCss(" ", "abc", 0, "a", "xa", 100,...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('abc');
      logInfo(`new DslCss(" ", "abc", 0, "a", "xa", 100,...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(50);
      logInfo(`new DslCss(" ", "abc", 0, "a", "xa", 100,...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(25);
      logInfo(`${BUNDLE}DslCssCtor_0170 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0171
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0171
     * @tc.desc      new DslCss("xabc", "xabc", 0, "abc_1", "xabc", 100, 100, "Hello World", 100, 100, 15, 5, "HelloH...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0171 begin`);
      const subject: DslCss = new DslCss('xabc', 'xabc', 0, 'abc_1', 'xabc', 100, 100, 'Hello World', 100, 100, 15, 5,
        'HelloHello');
      logInfo(`new DslCss("xabc", "xabc", 0, "abc_1", "x...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('xabc');
      logInfo(`new DslCss("xabc", "xabc", 0, "abc_1", "x...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('xabc');
      logInfo(`new DslCss("xabc", "xabc", 0, "abc_1", "x...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("xabc", "xabc", 0, "abc_1", "x...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('abc_1');
      logInfo(`new DslCss("xabc", "xabc", 0, "abc_1", "x...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('xabc');
      logInfo(`new DslCss("xabc", "xabc", 0, "abc_1", "x...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(100);
      logInfo(`new DslCss("xabc", "xabc", 0, "abc_1", "x...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(100);
      logInfo(`new DslCss("xabc", "xabc", 0, "abc_1", "x...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('Hello World');
      logInfo(`new DslCss("xabc", "xabc", 0, "abc_1", "x...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(100);
      logInfo(`new DslCss("xabc", "xabc", 0, "abc_1", "x...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(100);
      logInfo(`${BUNDLE}DslCssCtor_0171 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0172
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0172
     * @tc.desc      new DslCss("abc", "abcabc", 10, " abc ", "abc_1", 10, 10, "xa", 85, 20, 1, -100, "abc") initiali...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0172 begin`);
      const subject: DslCss = new DslCss('abc', 'abcabc', 10, ' abc ', 'abc_1', 10, 10, 'xa', 85, 20, 1, -100, 'abc');
      logInfo(`new DslCss("abc", "abcabc", 10, " abc ", ...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('abc');
      logInfo(`new DslCss("abc", "abcabc", 10, " abc ", ...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('abcabc');
      logInfo(`new DslCss("abc", "abcabc", 10, " abc ", ...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(10);
      logInfo(`new DslCss("abc", "abcabc", 10, " abc ", ...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual(' abc ');
      logInfo(`new DslCss("abc", "abcabc", 10, " abc ", ...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('abc_1');
      logInfo(`new DslCss("abc", "abcabc", 10, " abc ", ...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(10);
      logInfo(`new DslCss("abc", "abcabc", 10, " abc ", ...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(10);
      logInfo(`new DslCss("abc", "abcabc", 10, " abc ", ...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('xa');
      logInfo(`new DslCss("abc", "abcabc", 10, " abc ", ...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(85);
      logInfo(`new DslCss("abc", "abcabc", 10, " abc ", ...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(20);
      logInfo(`${BUNDLE}DslCssCtor_0172 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0173
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0173
     * @tc.desc      new DslCss(" abc ", " ", -73, "abc", " a ", 3, 1, "abc", -1, 3, -100, 35, "") initialises 10 pub...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0173 begin`);
      const subject: DslCss = new DslCss(' abc ', ' ', -73, 'abc', ' a ', 3, 1, 'abc', -1, 3, -100, 35, '');
      logInfo(`new DslCss(" abc ", " ", -73, "abc", " a ...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual(' abc ');
      logInfo(`new DslCss(" abc ", " ", -73, "abc", " a ...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual(' ');
      logInfo(`new DslCss(" abc ", " ", -73, "abc", " a ...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(-73);
      logInfo(`new DslCss(" abc ", " ", -73, "abc", " a ...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('abc');
      logInfo(`new DslCss(" abc ", " ", -73, "abc", " a ...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual(' a ');
      logInfo(`new DslCss(" abc ", " ", -73, "abc", " a ...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(3);
      logInfo(`new DslCss(" abc ", " ", -73, "abc", " a ...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(1);
      logInfo(`new DslCss(" abc ", " ", -73, "abc", " a ...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('abc');
      logInfo(`new DslCss(" abc ", " ", -73, "abc", " a ...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-1);
      logInfo(`new DslCss(" abc ", " ", -73, "abc", " a ...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(3);
      logInfo(`${BUNDLE}DslCssCtor_0173 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0174
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0174
     * @tc.desc      new DslCss("123", "aa", -1, "aa", " abc ", 50, 30, "a_1", 2, 2, 35, 100, "a") initialises 10 pub...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0174 begin`);
      const subject: DslCss = new DslCss('123', 'aa', -1, 'aa', ' abc ', 50, 30, 'a_1', 2, 2, 35, 100, 'a');
      logInfo(`new DslCss("123", "aa", -1, "aa", " abc "...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('123');
      logInfo(`new DslCss("123", "aa", -1, "aa", " abc "...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('aa');
      logInfo(`new DslCss("123", "aa", -1, "aa", " abc "...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(-1);
      logInfo(`new DslCss("123", "aa", -1, "aa", " abc "...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('aa');
      logInfo(`new DslCss("123", "aa", -1, "aa", " abc "...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual(' abc ');
      logInfo(`new DslCss("123", "aa", -1, "aa", " abc "...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(50);
      logInfo(`new DslCss("123", "aa", -1, "aa", " abc "...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(30);
      logInfo(`new DslCss("123", "aa", -1, "aa", " abc "...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('a_1');
      logInfo(`new DslCss("123", "aa", -1, "aa", " abc "...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(2);
      logInfo(`new DslCss("123", "aa", -1, "aa", " abc "...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(2);
      logInfo(`${BUNDLE}DslCssCtor_0174 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0175
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0175
     * @tc.desc      new DslCss("xa", " a ", 1, "abcabc", " abc ", 50, 0, "xabc", 0, 1, 3, 1, "Sample Title 123") ini...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0175 begin`);
      const subject: DslCss = new DslCss('xa', ' a ', 1, 'abcabc', ' abc ', 50, 0, 'xabc', 0, 1, 3, 1,
        'Sample Title 123');
      logInfo(`new DslCss("xa", " a ", 1, "abcabc", " ab...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('xa');
      logInfo(`new DslCss("xa", " a ", 1, "abcabc", " ab...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual(' a ');
      logInfo(`new DslCss("xa", " a ", 1, "abcabc", " ab...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(1);
      logInfo(`new DslCss("xa", " a ", 1, "abcabc", " ab...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('abcabc');
      logInfo(`new DslCss("xa", " a ", 1, "abcabc", " ab...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual(' abc ');
      logInfo(`new DslCss("xa", " a ", 1, "abcabc", " ab...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(50);
      logInfo(`new DslCss("xa", " a ", 1, "abcabc", " ab...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("xa", " a ", 1, "abcabc", " ab...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('xabc');
      logInfo(`new DslCss("xa", " a ", 1, "abcabc", " ab...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(0);
      logInfo(`new DslCss("xa", " a ", 1, "abcabc", " ab...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(1);
      logInfo(`${BUNDLE}DslCssCtor_0175 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0176
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0176
     * @tc.desc      new DslCss("abc", " a ", 30, "xa", "aa", 401, 1.5, "", 3, 15, 0, 15, "??") initialises 10 public...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0176 begin`);
      const subject: DslCss = new DslCss('abc', ' a ', 30, 'xa', 'aa', 401, 1.5, '', 3, 15, 0, 15, '\u4e2d\u6587');
      logInfo(`new DslCss("abc", " a ", 30, "xa", "aa", ...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('abc');
      logInfo(`new DslCss("abc", " a ", 30, "xa", "aa", ...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual(' a ');
      logInfo(`new DslCss("abc", " a ", 30, "xa", "aa", ...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(30);
      logInfo(`new DslCss("abc", " a ", 30, "xa", "aa", ...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('xa');
      logInfo(`new DslCss("abc", " a ", 30, "xa", "aa", ...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('aa');
      logInfo(`new DslCss("abc", " a ", 30, "xa", "aa", ...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(401);
      logInfo(`new DslCss("abc", " a ", 30, "xa", "aa", ...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertClose(1.5, PRECISION);
      logInfo(`new DslCss("abc", " a ", 30, "xa", "aa", ...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("abc", " a ", 30, "xa", "aa", ...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(3);
      logInfo(`new DslCss("abc", " a ", 30, "xa", "aa", ...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(15);
      logInfo(`${BUNDLE}DslCssCtor_0176 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0177
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0177
     * @tc.desc      new DslCss("xa", " ", -1, "abc", " ", 25, 0.5, "", 35, 15, 30, 1, "hello world") initialises 10 ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0177 begin`);
      const subject: DslCss = new DslCss('xa', ' ', -1, 'abc', ' ', 25, 0.5, '', 35, 15, 30, 1, 'hello world');
      logInfo(`new DslCss("xa", " ", -1, "abc", " ", 25,...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('xa');
      logInfo(`new DslCss("xa", " ", -1, "abc", " ", 25,...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual(' ');
      logInfo(`new DslCss("xa", " ", -1, "abc", " ", 25,...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(-1);
      logInfo(`new DslCss("xa", " ", -1, "abc", " ", 25,...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('abc');
      logInfo(`new DslCss("xa", " ", -1, "abc", " ", 25,...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual(' ');
      logInfo(`new DslCss("xa", " ", -1, "abc", " ", 25,...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(25);
      logInfo(`new DslCss("xa", " ", -1, "abc", " ", 25,...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertClose(0.5, PRECISION);
      logInfo(`new DslCss("xa", " ", -1, "abc", " ", 25,...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("xa", " ", -1, "abc", " ", 25,...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(35);
      logInfo(`new DslCss("xa", " ", -1, "abc", " ", 25,...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(15);
      logInfo(`${BUNDLE}DslCssCtor_0177 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0178
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0178
     * @tc.desc      new DslCss(" a ", "123", -1, "xa", "abc", 200, 25, "xa", -1, 25.66, 5, 100, "Sample Title 123") ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0178 begin`);
      const subject: DslCss = new DslCss(' a ', '123', -1, 'xa', 'abc', 200, 25, 'xa', -1, 25.66, 5, 100,
        'Sample Title 123');
      logInfo(`new DslCss(" a ", "123", -1, "xa", "abc",...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual(' a ');
      logInfo(`new DslCss(" a ", "123", -1, "xa", "abc",...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('123');
      logInfo(`new DslCss(" a ", "123", -1, "xa", "abc",...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(-1);
      logInfo(`new DslCss(" a ", "123", -1, "xa", "abc",...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('xa');
      logInfo(`new DslCss(" a ", "123", -1, "xa", "abc",...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('abc');
      logInfo(`new DslCss(" a ", "123", -1, "xa", "abc",...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(200);
      logInfo(`new DslCss(" a ", "123", -1, "xa", "abc",...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(25);
      logInfo(`new DslCss(" a ", "123", -1, "xa", "abc",...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('xa');
      logInfo(`new DslCss(" a ", "123", -1, "xa", "abc",...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-1);
      logInfo(`new DslCss(" a ", "123", -1, "xa", "abc",...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertClose(25.66, PRECISION);
      logInfo(`${BUNDLE}DslCssCtor_0178 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0179
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0179
     * @tc.desc      new DslCss(" ", " ", 100, "aa", "abc_1", 500, 20, "a_1", 3, 1, 10, 0, "??") initialises 10 publi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0179 begin`);
      const subject: DslCss = new DslCss(' ', ' ', 100, 'aa', 'abc_1', 500, 20, 'a_1', 3, 1, 10, 0, '\u4e2d\u6587');
      logInfo(`new DslCss(" ", " ", 100, "aa", "abc_1", ...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual(' ');
      logInfo(`new DslCss(" ", " ", 100, "aa", "abc_1", ...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual(' ');
      logInfo(`new DslCss(" ", " ", 100, "aa", "abc_1", ...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(100);
      logInfo(`new DslCss(" ", " ", 100, "aa", "abc_1", ...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('aa');
      logInfo(`new DslCss(" ", " ", 100, "aa", "abc_1", ...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('abc_1');
      logInfo(`new DslCss(" ", " ", 100, "aa", "abc_1", ...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(500);
      logInfo(`new DslCss(" ", " ", 100, "aa", "abc_1", ...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(20);
      logInfo(`new DslCss(" ", " ", 100, "aa", "abc_1", ...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('a_1');
      logInfo(`new DslCss(" ", " ", 100, "aa", "abc_1", ...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(3);
      logInfo(`new DslCss(" ", " ", 100, "aa", "abc_1", ...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(1);
      logInfo(`${BUNDLE}DslCssCtor_0179 end`);
    });
  });
}
