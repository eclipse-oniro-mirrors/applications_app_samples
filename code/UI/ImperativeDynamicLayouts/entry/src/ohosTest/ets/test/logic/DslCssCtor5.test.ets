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
export default function dslCssCtor5Test(): void {
  describe('DslCssCtor5Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0180
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0180
     * @tc.desc      new DslCss("xa", "abc_1", 20, "123", "a", 500, 10, "xa", 10, 20, 10, 25, "123") initialises 10 p...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0180 begin`);
      const subject: DslCss = new DslCss('xa', 'abc_1', 20, '123', 'a', 500, 10, 'xa', 10, 20, 10, 25, '123');
      logInfo(`new DslCss("xa", "abc_1", 20, "123", "a",...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('xa');
      logInfo(`new DslCss("xa", "abc_1", 20, "123", "a",...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('abc_1');
      logInfo(`new DslCss("xa", "abc_1", 20, "123", "a",...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(20);
      logInfo(`new DslCss("xa", "abc_1", 20, "123", "a",...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('123');
      logInfo(`new DslCss("xa", "abc_1", 20, "123", "a",...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('a');
      logInfo(`new DslCss("xa", "abc_1", 20, "123", "a",...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(500);
      logInfo(`new DslCss("xa", "abc_1", 20, "123", "a",...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(10);
      logInfo(`new DslCss("xa", "abc_1", 20, "123", "a",...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('xa');
      logInfo(`new DslCss("xa", "abc_1", 20, "123", "a",...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(10);
      logInfo(`new DslCss("xa", "abc_1", 20, "123", "a",...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(20);
      logInfo(`${BUNDLE}DslCssCtor_0180 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0181
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0181
     * @tc.desc      new DslCss("abc", "aa", 5, "a", "", -1, 5, "123", 25, 1, 25, 30, "123") initialises 10 public me...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0181 begin`);
      const subject: DslCss = new DslCss('abc', 'aa', 5, 'a', '', -1, 5, '123', 25, 1, 25, 30, '123');
      logInfo(`new DslCss("abc", "aa", 5, "a", "", -1, 5...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('abc');
      logInfo(`new DslCss("abc", "aa", 5, "a", "", -1, 5...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('aa');
      logInfo(`new DslCss("abc", "aa", 5, "a", "", -1, 5...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(5);
      logInfo(`new DslCss("abc", "aa", 5, "a", "", -1, 5...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('a');
      logInfo(`new DslCss("abc", "aa", 5, "a", "", -1, 5...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("abc", "aa", 5, "a", "", -1, 5...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(-1);
      logInfo(`new DslCss("abc", "aa", 5, "a", "", -1, 5...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(5);
      logInfo(`new DslCss("abc", "aa", 5, "a", "", -1, 5...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('123');
      logInfo(`new DslCss("abc", "aa", 5, "a", "", -1, 5...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(25);
      logInfo(`new DslCss("abc", "aa", 5, "a", "", -1, 5...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(1);
      logInfo(`${BUNDLE}DslCssCtor_0181 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0182
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0182
     * @tc.desc      new DslCss("xa", "a_1", 20, "Hello World", "", 500, 10, "abcabc", -1, 25.66, 0, 1, "Hello_1") in...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0182 begin`);
      const subject: DslCss = new DslCss('xa', 'a_1', 20, 'Hello World', '', 500, 10, 'abcabc', -1, 25.66, 0, 1,
        'Hello_1');
      logInfo(`new DslCss("xa", "a_1", 20, "Hello World"...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('xa');
      logInfo(`new DslCss("xa", "a_1", 20, "Hello World"...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('a_1');
      logInfo(`new DslCss("xa", "a_1", 20, "Hello World"...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(20);
      logInfo(`new DslCss("xa", "a_1", 20, "Hello World"...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('Hello World');
      logInfo(`new DslCss("xa", "a_1", 20, "Hello World"...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("xa", "a_1", 20, "Hello World"...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(500);
      logInfo(`new DslCss("xa", "a_1", 20, "Hello World"...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(10);
      logInfo(`new DslCss("xa", "a_1", 20, "Hello World"...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('abcabc');
      logInfo(`new DslCss("xa", "a_1", 20, "Hello World"...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-1);
      logInfo(`new DslCss("xa", "a_1", 20, "Hello World"...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertClose(25.66, PRECISION);
      logInfo(`${BUNDLE}DslCssCtor_0182 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0183
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0183
     * @tc.desc      new DslCss("abcabc", "xa", 15, " a ", " a ", 3, 1.5, "aa", 30, 5, -1, -100, "Sample Title 123") ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0183 begin`);
      const subject: DslCss = new DslCss('abcabc', 'xa', 15, ' a ', ' a ', 3, 1.5, 'aa', 30, 5, -1, -100,
        'Sample Title 123');
      logInfo(`new DslCss("abcabc", "xa", 15, " a ", " a...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('abcabc');
      logInfo(`new DslCss("abcabc", "xa", 15, " a ", " a...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('xa');
      logInfo(`new DslCss("abcabc", "xa", 15, " a ", " a...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(15);
      logInfo(`new DslCss("abcabc", "xa", 15, " a ", " a...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual(' a ');
      logInfo(`new DslCss("abcabc", "xa", 15, " a ", " a...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual(' a ');
      logInfo(`new DslCss("abcabc", "xa", 15, " a ", " a...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(3);
      logInfo(`new DslCss("abcabc", "xa", 15, " a ", " a...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertClose(1.5, PRECISION);
      logInfo(`new DslCss("abcabc", "xa", 15, " a ", " a...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('aa');
      logInfo(`new DslCss("abcabc", "xa", 15, " a ", " a...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(30);
      logInfo(`new DslCss("abcabc", "xa", 15, " a ", " a...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(5);
      logInfo(`${BUNDLE}DslCssCtor_0183 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0184
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0184
     * @tc.desc      new DslCss("abc", "xabc", 20, "xabc", " ", 1, 1, "a_1", 85, -100, -1, 1, "a") initialises 10 pub...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0184 begin`);
      const subject: DslCss = new DslCss('abc', 'xabc', 20, 'xabc', ' ', 1, 1, 'a_1', 85, -100, -1, 1, 'a');
      logInfo(`new DslCss("abc", "xabc", 20, "xabc", " "...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('abc');
      logInfo(`new DslCss("abc", "xabc", 20, "xabc", " "...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('xabc');
      logInfo(`new DslCss("abc", "xabc", 20, "xabc", " "...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(20);
      logInfo(`new DslCss("abc", "xabc", 20, "xabc", " "...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('xabc');
      logInfo(`new DslCss("abc", "xabc", 20, "xabc", " "...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual(' ');
      logInfo(`new DslCss("abc", "xabc", 20, "xabc", " "...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(1);
      logInfo(`new DslCss("abc", "xabc", 20, "xabc", " "...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(1);
      logInfo(`new DslCss("abc", "xabc", 20, "xabc", " "...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('a_1');
      logInfo(`new DslCss("abc", "xabc", 20, "xabc", " "...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(85);
      logInfo(`new DslCss("abc", "xabc", 20, "xabc", " "...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0184 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0185
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0185
     * @tc.desc      new DslCss("xa", "", 3, "xa", "a", 10, 3, "a_1", 85, 5, 3, 25, "Hello") initialises 10 public me...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0185 begin`);
      const subject: DslCss = new DslCss('xa', '', 3, 'xa', 'a', 10, 3, 'a_1', 85, 5, 3, 25, 'Hello');
      logInfo(`new DslCss("xa", "", 3, "xa", "a", 10, 3,...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('xa');
      logInfo(`new DslCss("xa", "", 3, "xa", "a", 10, 3,...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("xa", "", 3, "xa", "a", 10, 3,...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(3);
      logInfo(`new DslCss("xa", "", 3, "xa", "a", 10, 3,...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('xa');
      logInfo(`new DslCss("xa", "", 3, "xa", "a", 10, 3,...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('a');
      logInfo(`new DslCss("xa", "", 3, "xa", "a", 10, 3,...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(10);
      logInfo(`new DslCss("xa", "", 3, "xa", "a", 10, 3,...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(3);
      logInfo(`new DslCss("xa", "", 3, "xa", "a", 10, 3,...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('a_1');
      logInfo(`new DslCss("xa", "", 3, "xa", "a", 10, 3,...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(85);
      logInfo(`new DslCss("xa", "", 3, "xa", "a", 10, 3,...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(5);
      logInfo(`${BUNDLE}DslCssCtor_0185 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0186
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0186
     * @tc.desc      new DslCss("abc", "xa", 100, "abc", "abc_1", 100, 1, " abc ", 3, 25, 20, 3, "Sample Title 123") ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0186 begin`);
      const subject: DslCss = new DslCss('abc', 'xa', 100, 'abc', 'abc_1', 100, 1, ' abc ', 3, 25, 20, 3,
        'Sample Title 123');
      logInfo(`new DslCss("abc", "xa", 100, "abc", "abc_...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('abc');
      logInfo(`new DslCss("abc", "xa", 100, "abc", "abc_...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('xa');
      logInfo(`new DslCss("abc", "xa", 100, "abc", "abc_...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(100);
      logInfo(`new DslCss("abc", "xa", 100, "abc", "abc_...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('abc');
      logInfo(`new DslCss("abc", "xa", 100, "abc", "abc_...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('abc_1');
      logInfo(`new DslCss("abc", "xa", 100, "abc", "abc_...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(100);
      logInfo(`new DslCss("abc", "xa", 100, "abc", "abc_...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(1);
      logInfo(`new DslCss("abc", "xa", 100, "abc", "abc_...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual(' abc ');
      logInfo(`new DslCss("abc", "xa", 100, "abc", "abc_...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(3);
      logInfo(`new DslCss("abc", "xa", 100, "abc", "abc_...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(25);
      logInfo(`${BUNDLE}DslCssCtor_0186 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0187
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0187
     * @tc.desc      new DslCss("a_1", "abc", 2, " abc ", "a_1", 10, 15, "abc_1", 5, 25.66, 20, 20, "a") initialises ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0187 begin`);
      const subject: DslCss = new DslCss('a_1', 'abc', 2, ' abc ', 'a_1', 10, 15, 'abc_1', 5, 25.66, 20, 20, 'a');
      logInfo(`new DslCss("a_1", "abc", 2, " abc ", "a_1...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('a_1');
      logInfo(`new DslCss("a_1", "abc", 2, " abc ", "a_1...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('abc');
      logInfo(`new DslCss("a_1", "abc", 2, " abc ", "a_1...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(2);
      logInfo(`new DslCss("a_1", "abc", 2, " abc ", "a_1...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual(' abc ');
      logInfo(`new DslCss("a_1", "abc", 2, " abc ", "a_1...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('a_1');
      logInfo(`new DslCss("a_1", "abc", 2, " abc ", "a_1...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(10);
      logInfo(`new DslCss("a_1", "abc", 2, " abc ", "a_1...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(15);
      logInfo(`new DslCss("a_1", "abc", 2, " abc ", "a_1...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('abc_1');
      logInfo(`new DslCss("a_1", "abc", 2, " abc ", "a_1...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(5);
      logInfo(`new DslCss("a_1", "abc", 2, " abc ", "a_1...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertClose(25.66, PRECISION);
      logInfo(`${BUNDLE}DslCssCtor_0187 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0188
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0188
     * @tc.desc      new DslCss(" ", "abc", 0, "xabc", "xabc", 3, 0.25, "abcabc", 100, 3, 15, 25, "a") initialises 10...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0188 begin`);
      const subject: DslCss = new DslCss(' ', 'abc', 0, 'xabc', 'xabc', 3, 0.25, 'abcabc', 100, 3, 15, 25, 'a');
      logInfo(`new DslCss(" ", "abc", 0, "xabc", "xabc",...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual(' ');
      logInfo(`new DslCss(" ", "abc", 0, "xabc", "xabc",...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('abc');
      logInfo(`new DslCss(" ", "abc", 0, "xabc", "xabc",...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss(" ", "abc", 0, "xabc", "xabc",...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('xabc');
      logInfo(`new DslCss(" ", "abc", 0, "xabc", "xabc",...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('xabc');
      logInfo(`new DslCss(" ", "abc", 0, "xabc", "xabc",...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(3);
      logInfo(`new DslCss(" ", "abc", 0, "xabc", "xabc",...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertClose(0.25, PRECISION);
      logInfo(`new DslCss(" ", "abc", 0, "xabc", "xabc",...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('abcabc');
      logInfo(`new DslCss(" ", "abc", 0, "xabc", "xabc",...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(100);
      logInfo(`new DslCss(" ", "abc", 0, "xabc", "xabc",...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(3);
      logInfo(`${BUNDLE}DslCssCtor_0188 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0189
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0189
     * @tc.desc      new DslCss("a_1", " a ", 25, "a", "", 401, 100, "xabc", 2, 50, -1, 0, "a") initialises 10 public...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0189 begin`);
      const subject: DslCss = new DslCss('a_1', ' a ', 25, 'a', '', 401, 100, 'xabc', 2, 50, -1, 0, 'a');
      logInfo(`new DslCss("a_1", " a ", 25, "a", "", 401...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('a_1');
      logInfo(`new DslCss("a_1", " a ", 25, "a", "", 401...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual(' a ');
      logInfo(`new DslCss("a_1", " a ", 25, "a", "", 401...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(25);
      logInfo(`new DslCss("a_1", " a ", 25, "a", "", 401...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('a');
      logInfo(`new DslCss("a_1", " a ", 25, "a", "", 401...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("a_1", " a ", 25, "a", "", 401...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(401);
      logInfo(`new DslCss("a_1", " a ", 25, "a", "", 401...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(100);
      logInfo(`new DslCss("a_1", " a ", 25, "a", "", 401...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('xabc');
      logInfo(`new DslCss("a_1", " a ", 25, "a", "", 401...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(2);
      logInfo(`new DslCss("a_1", " a ", 25, "a", "", 401...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(50);
      logInfo(`${BUNDLE}DslCssCtor_0189 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0190
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0190
     * @tc.desc      new DslCss("a_1", " ", 5, " abc ", "a", 3, -13, "Hello World", 25, 3, 3, 50, "??") initialises 1...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0190 begin`);
      const subject: DslCss = new DslCss('a_1', ' ', 5, ' abc ', 'a', 3, -13, 'Hello World', 25, 3, 3, 50,
        '\u4e2d\u6587');
      logInfo(`new DslCss("a_1", " ", 5, " abc ", "a", 3...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('a_1');
      logInfo(`new DslCss("a_1", " ", 5, " abc ", "a", 3...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual(' ');
      logInfo(`new DslCss("a_1", " ", 5, " abc ", "a", 3...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(5);
      logInfo(`new DslCss("a_1", " ", 5, " abc ", "a", 3...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual(' abc ');
      logInfo(`new DslCss("a_1", " ", 5, " abc ", "a", 3...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('a');
      logInfo(`new DslCss("a_1", " ", 5, " abc ", "a", 3...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(3);
      logInfo(`new DslCss("a_1", " ", 5, " abc ", "a", 3...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(-13);
      logInfo(`new DslCss("a_1", " ", 5, " abc ", "a", 3...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('Hello World');
      logInfo(`new DslCss("a_1", " ", 5, " abc ", "a", 3...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(25);
      logInfo(`new DslCss("a_1", " ", 5, " abc ", "a", 3...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(3);
      logInfo(`${BUNDLE}DslCssCtor_0190 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0191
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0191
     * @tc.desc      new DslCss("abc", "xabc", 5, " a ", "a", 404, -13, "xa", 3, 35, 30, 100, "abc") initialises 10 p...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0191 begin`);
      const subject: DslCss = new DslCss('abc', 'xabc', 5, ' a ', 'a', 404, -13, 'xa', 3, 35, 30, 100, 'abc');
      logInfo(`new DslCss("abc", "xabc", 5, " a ", "a", ...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('abc');
      logInfo(`new DslCss("abc", "xabc", 5, " a ", "a", ...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('xabc');
      logInfo(`new DslCss("abc", "xabc", 5, " a ", "a", ...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(5);
      logInfo(`new DslCss("abc", "xabc", 5, " a ", "a", ...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual(' a ');
      logInfo(`new DslCss("abc", "xabc", 5, " a ", "a", ...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('a');
      logInfo(`new DslCss("abc", "xabc", 5, " a ", "a", ...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(404);
      logInfo(`new DslCss("abc", "xabc", 5, " a ", "a", ...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(-13);
      logInfo(`new DslCss("abc", "xabc", 5, " a ", "a", ...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('xa');
      logInfo(`new DslCss("abc", "xabc", 5, " a ", "a", ...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(3);
      logInfo(`new DslCss("abc", "xabc", 5, " a ", "a", ...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(35);
      logInfo(`${BUNDLE}DslCssCtor_0191 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0192
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0192
     * @tc.desc      new DslCss("abc_1", "abcabc", 25, " abc ", "aa", 125, 0.25, "123", 30, 25, 20, 50, "hello world"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0192 begin`);
      const subject: DslCss = new DslCss('abc_1', 'abcabc', 25, ' abc ', 'aa', 125, 0.25, '123', 30, 25, 20, 50,
        'hello world');
      logInfo(`new DslCss("abc_1", "abcabc", 25, " abc "...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('abc_1');
      logInfo(`new DslCss("abc_1", "abcabc", 25, " abc "...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('abcabc');
      logInfo(`new DslCss("abc_1", "abcabc", 25, " abc "...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(25);
      logInfo(`new DslCss("abc_1", "abcabc", 25, " abc "...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual(' abc ');
      logInfo(`new DslCss("abc_1", "abcabc", 25, " abc "...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('aa');
      logInfo(`new DslCss("abc_1", "abcabc", 25, " abc "...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(125);
      logInfo(`new DslCss("abc_1", "abcabc", 25, " abc "...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertClose(0.25, PRECISION);
      logInfo(`new DslCss("abc_1", "abcabc", 25, " abc "...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('123');
      logInfo(`new DslCss("abc_1", "abcabc", 25, " abc "...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(30);
      logInfo(`new DslCss("abc_1", "abcabc", 25, " abc "...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(25);
      logInfo(`${BUNDLE}DslCssCtor_0192 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0193
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0193
     * @tc.desc      new DslCss("xa", "a_1", -73, " ", "123", -1, 0, "abc_1", 35, 3, 10, 30, "Hello_1") initialises 1...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0193 begin`);
      const subject: DslCss = new DslCss('xa', 'a_1', -73, ' ', '123', -1, 0, 'abc_1', 35, 3, 10, 30, 'Hello_1');
      logInfo(`new DslCss("xa", "a_1", -73, " ", "123", ...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('xa');
      logInfo(`new DslCss("xa", "a_1", -73, " ", "123", ...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('a_1');
      logInfo(`new DslCss("xa", "a_1", -73, " ", "123", ...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(-73);
      logInfo(`new DslCss("xa", "a_1", -73, " ", "123", ...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual(' ');
      logInfo(`new DslCss("xa", "a_1", -73, " ", "123", ...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('123');
      logInfo(`new DslCss("xa", "a_1", -73, " ", "123", ...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(-1);
      logInfo(`new DslCss("xa", "a_1", -73, " ", "123", ...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("xa", "a_1", -73, " ", "123", ...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('abc_1');
      logInfo(`new DslCss("xa", "a_1", -73, " ", "123", ...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(35);
      logInfo(`new DslCss("xa", "a_1", -73, " ", "123", ...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(3);
      logInfo(`${BUNDLE}DslCssCtor_0193 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0194
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0194
     * @tc.desc      new DslCss(" a ", "abc", 0, " a ", "xabc", 25, 15, "abc", 0, 0, 0, 50, "??") initialises 10 publ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0194 begin`);
      const subject: DslCss = new DslCss(' a ', 'abc', 0, ' a ', 'xabc', 25, 15, 'abc', 0, 0, 0, 50, '\u4e2d\u6587');
      logInfo(`new DslCss(" a ", "abc", 0, " a ", "xabc"...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual(' a ');
      logInfo(`new DslCss(" a ", "abc", 0, " a ", "xabc"...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('abc');
      logInfo(`new DslCss(" a ", "abc", 0, " a ", "xabc"...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss(" a ", "abc", 0, " a ", "xabc"...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual(' a ');
      logInfo(`new DslCss(" a ", "abc", 0, " a ", "xabc"...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('xabc');
      logInfo(`new DslCss(" a ", "abc", 0, " a ", "xabc"...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(25);
      logInfo(`new DslCss(" a ", "abc", 0, " a ", "xabc"...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(15);
      logInfo(`new DslCss(" a ", "abc", 0, " a ", "xabc"...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('abc');
      logInfo(`new DslCss(" a ", "abc", 0, " a ", "xabc"...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(0);
      logInfo(`new DslCss(" a ", "abc", 0, " a ", "xabc"...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(0);
      logInfo(`${BUNDLE}DslCssCtor_0194 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0195
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0195
     * @tc.desc      new DslCss("Hello World", "a", 51, "aa", " ", 200, 15, "a_1", 30, 0, 30, 10, "a") initialises 10...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0195 begin`);
      const subject: DslCss = new DslCss('Hello World', 'a', 51, 'aa', ' ', 200, 15, 'a_1', 30, 0, 30, 10, 'a');
      logInfo(`new DslCss("Hello World", "a", 51, "aa", ...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('Hello World');
      logInfo(`new DslCss("Hello World", "a", 51, "aa", ...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('a');
      logInfo(`new DslCss("Hello World", "a", 51, "aa", ...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(51);
      logInfo(`new DslCss("Hello World", "a", 51, "aa", ...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('aa');
      logInfo(`new DslCss("Hello World", "a", 51, "aa", ...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual(' ');
      logInfo(`new DslCss("Hello World", "a", 51, "aa", ...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(200);
      logInfo(`new DslCss("Hello World", "a", 51, "aa", ...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(15);
      logInfo(`new DslCss("Hello World", "a", 51, "aa", ...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('a_1');
      logInfo(`new DslCss("Hello World", "a", 51, "aa", ...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(30);
      logInfo(`new DslCss("Hello World", "a", 51, "aa", ...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(0);
      logInfo(`${BUNDLE}DslCssCtor_0195 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0196
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0196
     * @tc.desc      new DslCss("Hello World", " a ", 2, "123", "xa", 200, 0.25, "abc_1", 3, 5, 50, -100, "HelloHello...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0196 begin`);
      const subject: DslCss = new DslCss('Hello World', ' a ', 2, '123', 'xa', 200, 0.25, 'abc_1', 3, 5, 50, -100,
        'HelloHello');
      logInfo(`new DslCss("Hello World", " a ", 2, "123"...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('Hello World');
      logInfo(`new DslCss("Hello World", " a ", 2, "123"...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual(' a ');
      logInfo(`new DslCss("Hello World", " a ", 2, "123"...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(2);
      logInfo(`new DslCss("Hello World", " a ", 2, "123"...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('123');
      logInfo(`new DslCss("Hello World", " a ", 2, "123"...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('xa');
      logInfo(`new DslCss("Hello World", " a ", 2, "123"...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(200);
      logInfo(`new DslCss("Hello World", " a ", 2, "123"...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertClose(0.25, PRECISION);
      logInfo(`new DslCss("Hello World", " a ", 2, "123"...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('abc_1');
      logInfo(`new DslCss("Hello World", " a ", 2, "123"...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(3);
      logInfo(`new DslCss("Hello World", " a ", 2, "123"...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(5);
      logInfo(`${BUNDLE}DslCssCtor_0196 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0197
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0197
     * @tc.desc      new DslCss(" ", " a ", -1, "aa", "abcabc", 200, 5, "xabc", -1, 20, 1, 145, "a") initialises 10 p...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0197 begin`);
      const subject: DslCss = new DslCss(' ', ' a ', -1, 'aa', 'abcabc', 200, 5, 'xabc', -1, 20, 1, 145, 'a');
      logInfo(`new DslCss(" ", " a ", -1, "aa", "abcabc"...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual(' ');
      logInfo(`new DslCss(" ", " a ", -1, "aa", "abcabc"...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual(' a ');
      logInfo(`new DslCss(" ", " a ", -1, "aa", "abcabc"...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(-1);
      logInfo(`new DslCss(" ", " a ", -1, "aa", "abcabc"...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('aa');
      logInfo(`new DslCss(" ", " a ", -1, "aa", "abcabc"...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('abcabc');
      logInfo(`new DslCss(" ", " a ", -1, "aa", "abcabc"...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(200);
      logInfo(`new DslCss(" ", " a ", -1, "aa", "abcabc"...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(5);
      logInfo(`new DslCss(" ", " a ", -1, "aa", "abcabc"...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('xabc');
      logInfo(`new DslCss(" ", " a ", -1, "aa", "abcabc"...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-1);
      logInfo(`new DslCss(" ", " a ", -1, "aa", "abcabc"...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(20);
      logInfo(`${BUNDLE}DslCssCtor_0197 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0198
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0198
     * @tc.desc      new DslCss("a_1", "123", 2, "abcabc", "abc", 404, 1, "xa", 5, 35, 78.2, -1, " Hello ") initialis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0198 begin`);
      const subject: DslCss = new DslCss('a_1', '123', 2, 'abcabc', 'abc', 404, 1, 'xa', 5, 35, 78.2, -1, ' Hello ');
      logInfo(`new DslCss("a_1", "123", 2, "abcabc", "ab...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('a_1');
      logInfo(`new DslCss("a_1", "123", 2, "abcabc", "ab...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('123');
      logInfo(`new DslCss("a_1", "123", 2, "abcabc", "ab...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(2);
      logInfo(`new DslCss("a_1", "123", 2, "abcabc", "ab...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('abcabc');
      logInfo(`new DslCss("a_1", "123", 2, "abcabc", "ab...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('abc');
      logInfo(`new DslCss("a_1", "123", 2, "abcabc", "ab...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(404);
      logInfo(`new DslCss("a_1", "123", 2, "abcabc", "ab...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(1);
      logInfo(`new DslCss("a_1", "123", 2, "abcabc", "ab...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('xa');
      logInfo(`new DslCss("a_1", "123", 2, "abcabc", "ab...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(5);
      logInfo(`new DslCss("a_1", "123", 2, "abcabc", "ab...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(35);
      logInfo(`${BUNDLE}DslCssCtor_0198 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0199
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0199
     * @tc.desc      new DslCss(" abc ", "abc_1", 2, " ", "xabc", 2, -13, "xabc", -100, -1, -1, 100, "123") initialis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0199 begin`);
      const subject: DslCss = new DslCss(' abc ', 'abc_1', 2, ' ', 'xabc', 2, -13, 'xabc', -100, -1, -1, 100, '123');
      logInfo(`new DslCss(" abc ", "abc_1", 2, " ", "xab...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual(' abc ');
      logInfo(`new DslCss(" abc ", "abc_1", 2, " ", "xab...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('abc_1');
      logInfo(`new DslCss(" abc ", "abc_1", 2, " ", "xab...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(2);
      logInfo(`new DslCss(" abc ", "abc_1", 2, " ", "xab...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual(' ');
      logInfo(`new DslCss(" abc ", "abc_1", 2, " ", "xab...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('xabc');
      logInfo(`new DslCss(" abc ", "abc_1", 2, " ", "xab...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(2);
      logInfo(`new DslCss(" abc ", "abc_1", 2, " ", "xab...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(-13);
      logInfo(`new DslCss(" abc ", "abc_1", 2, " ", "xab...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('xabc');
      logInfo(`new DslCss(" abc ", "abc_1", 2, " ", "xab...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss(" abc ", "abc_1", 2, " ", "xab...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-1);
      logInfo(`${BUNDLE}DslCssCtor_0199 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0200
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0200
     * @tc.desc      new DslCss("xa", "abcabc", 40, "xabc", " abc ", 0, 2, "Hello World", 10, 50, 25, 25, "Hello") in...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0200 begin`);
      const subject: DslCss = new DslCss('xa', 'abcabc', 40, 'xabc', ' abc ', 0, 2, 'Hello World', 10, 50, 25, 25,
        'Hello');
      logInfo(`new DslCss("xa", "abcabc", 40, "xabc", " ...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('xa');
      logInfo(`new DslCss("xa", "abcabc", 40, "xabc", " ...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('abcabc');
      logInfo(`new DslCss("xa", "abcabc", 40, "xabc", " ...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(40);
      logInfo(`new DslCss("xa", "abcabc", 40, "xabc", " ...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('xabc');
      logInfo(`new DslCss("xa", "abcabc", 40, "xabc", " ...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual(' abc ');
      logInfo(`new DslCss("xa", "abcabc", 40, "xabc", " ...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("xa", "abcabc", 40, "xabc", " ...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(2);
      logInfo(`new DslCss("xa", "abcabc", 40, "xabc", " ...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('Hello World');
      logInfo(`new DslCss("xa", "abcabc", 40, "xabc", " ...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(10);
      logInfo(`new DslCss("xa", "abcabc", 40, "xabc", " ...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(50);
      logInfo(`${BUNDLE}DslCssCtor_0200 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0201
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0201
     * @tc.desc      new DslCss("xa", "a", 20, "123", "abc_1", 404, -1, "123", 50, -100, 30, -100, " Hello ") initial...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0201 begin`);
      const subject: DslCss = new DslCss('xa', 'a', 20, '123', 'abc_1', 404, -1, '123', 50, -100, 30, -100, ' Hello ');
      logInfo(`new DslCss("xa", "a", 20, "123", "abc_1",...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('xa');
      logInfo(`new DslCss("xa", "a", 20, "123", "abc_1",...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('a');
      logInfo(`new DslCss("xa", "a", 20, "123", "abc_1",...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(20);
      logInfo(`new DslCss("xa", "a", 20, "123", "abc_1",...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('123');
      logInfo(`new DslCss("xa", "a", 20, "123", "abc_1",...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('abc_1');
      logInfo(`new DslCss("xa", "a", 20, "123", "abc_1",...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(404);
      logInfo(`new DslCss("xa", "a", 20, "123", "abc_1",...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(-1);
      logInfo(`new DslCss("xa", "a", 20, "123", "abc_1",...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('123');
      logInfo(`new DslCss("xa", "a", 20, "123", "abc_1",...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(50);
      logInfo(`new DslCss("xa", "a", 20, "123", "abc_1",...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0201 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0202
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0202
     * @tc.desc      new DslCss("xa", "Hello World", 10, "a", "", 3, 20, "abcabc", 25, -100, 50, 2, "a") initialises ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0202 begin`);
      const subject: DslCss = new DslCss('xa', 'Hello World', 10, 'a', '', 3, 20, 'abcabc', 25, -100, 50, 2, 'a');
      logInfo(`new DslCss("xa", "Hello World", 10, "a", ...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('xa');
      logInfo(`new DslCss("xa", "Hello World", 10, "a", ...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('Hello World');
      logInfo(`new DslCss("xa", "Hello World", 10, "a", ...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(10);
      logInfo(`new DslCss("xa", "Hello World", 10, "a", ...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('a');
      logInfo(`new DslCss("xa", "Hello World", 10, "a", ...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("xa", "Hello World", 10, "a", ...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(3);
      logInfo(`new DslCss("xa", "Hello World", 10, "a", ...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(20);
      logInfo(`new DslCss("xa", "Hello World", 10, "a", ...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('abcabc');
      logInfo(`new DslCss("xa", "Hello World", 10, "a", ...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(25);
      logInfo(`new DslCss("xa", "Hello World", 10, "a", ...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0202 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0203
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0203
     * @tc.desc      new DslCss("abc_1", "abc", 40, " abc ", "abc_1", 100, 1, "abc_1", 3, 25, 100, 145, "Hello_1") in...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0203 begin`);
      const subject: DslCss = new DslCss('abc_1', 'abc', 40, ' abc ', 'abc_1', 100, 1, 'abc_1', 3, 25, 100, 145,
        'Hello_1');
      logInfo(`new DslCss("abc_1", "abc", 40, " abc ", "...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('abc_1');
      logInfo(`new DslCss("abc_1", "abc", 40, " abc ", "...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('abc');
      logInfo(`new DslCss("abc_1", "abc", 40, " abc ", "...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(40);
      logInfo(`new DslCss("abc_1", "abc", 40, " abc ", "...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual(' abc ');
      logInfo(`new DslCss("abc_1", "abc", 40, " abc ", "...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('abc_1');
      logInfo(`new DslCss("abc_1", "abc", 40, " abc ", "...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(100);
      logInfo(`new DslCss("abc_1", "abc", 40, " abc ", "...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(1);
      logInfo(`new DslCss("abc_1", "abc", 40, " abc ", "...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('abc_1');
      logInfo(`new DslCss("abc_1", "abc", 40, " abc ", "...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(3);
      logInfo(`new DslCss("abc_1", "abc", 40, " abc ", "...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(25);
      logInfo(`${BUNDLE}DslCssCtor_0203 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0204
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0204
     * @tc.desc      new DslCss("abc", "abc", -1, "Hello World", "Hello World", 991, 5, "Hello World", 3, 100, 100, 1...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0204 begin`);
      const subject: DslCss = new DslCss('abc', 'abc', -1, 'Hello World', 'Hello World', 991, 5, 'Hello World', 3, 100,
        100, 15, ' Hello ');
      logInfo(`new DslCss("abc", "abc", -1, "Hello World...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('abc');
      logInfo(`new DslCss("abc", "abc", -1, "Hello World...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('abc');
      logInfo(`new DslCss("abc", "abc", -1, "Hello World...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(-1);
      logInfo(`new DslCss("abc", "abc", -1, "Hello World...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('Hello World');
      logInfo(`new DslCss("abc", "abc", -1, "Hello World...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('Hello World');
      logInfo(`new DslCss("abc", "abc", -1, "Hello World...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(991);
      logInfo(`new DslCss("abc", "abc", -1, "Hello World...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(5);
      logInfo(`new DslCss("abc", "abc", -1, "Hello World...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('Hello World');
      logInfo(`new DslCss("abc", "abc", -1, "Hello World...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(3);
      logInfo(`new DslCss("abc", "abc", -1, "Hello World...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(100);
      logInfo(`${BUNDLE}DslCssCtor_0204 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0205
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0205
     * @tc.desc      new DslCss("abcabc", "xabc", 15, "abc_1", " a ", 100, 0.5, "aa", 0, 3, 15, 50, "Hello") initiali...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0205 begin`);
      const subject: DslCss = new DslCss('abcabc', 'xabc', 15, 'abc_1', ' a ', 100, 0.5, 'aa', 0, 3, 15, 50, 'Hello');
      logInfo(`new DslCss("abcabc", "xabc", 15, "abc_1",...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('abcabc');
      logInfo(`new DslCss("abcabc", "xabc", 15, "abc_1",...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('xabc');
      logInfo(`new DslCss("abcabc", "xabc", 15, "abc_1",...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(15);
      logInfo(`new DslCss("abcabc", "xabc", 15, "abc_1",...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('abc_1');
      logInfo(`new DslCss("abcabc", "xabc", 15, "abc_1",...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual(' a ');
      logInfo(`new DslCss("abcabc", "xabc", 15, "abc_1",...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(100);
      logInfo(`new DslCss("abcabc", "xabc", 15, "abc_1",...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertClose(0.5, PRECISION);
      logInfo(`new DslCss("abcabc", "xabc", 15, "abc_1",...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('aa');
      logInfo(`new DslCss("abcabc", "xabc", 15, "abc_1",...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(0);
      logInfo(`new DslCss("abcabc", "xabc", 15, "abc_1",...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(3);
      logInfo(`${BUNDLE}DslCssCtor_0205 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0206
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0206
     * @tc.desc      new DslCss("123", "abc", 2, "", "xabc", 401, 0.5, "xabc", 35, 1, 3, -1, "A") initialises 10 publ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0206 begin`);
      const subject: DslCss = new DslCss('123', 'abc', 2, '', 'xabc', 401, 0.5, 'xabc', 35, 1, 3, -1, 'A');
      logInfo(`new DslCss("123", "abc", 2, "", "xabc", 4...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('123');
      logInfo(`new DslCss("123", "abc", 2, "", "xabc", 4...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('abc');
      logInfo(`new DslCss("123", "abc", 2, "", "xabc", 4...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(2);
      logInfo(`new DslCss("123", "abc", 2, "", "xabc", 4...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("123", "abc", 2, "", "xabc", 4...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('xabc');
      logInfo(`new DslCss("123", "abc", 2, "", "xabc", 4...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(401);
      logInfo(`new DslCss("123", "abc", 2, "", "xabc", 4...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertClose(0.5, PRECISION);
      logInfo(`new DslCss("123", "abc", 2, "", "xabc", 4...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('xabc');
      logInfo(`new DslCss("123", "abc", 2, "", "xabc", 4...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(35);
      logInfo(`new DslCss("123", "abc", 2, "", "xabc", 4...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(1);
      logInfo(`${BUNDLE}DslCssCtor_0206 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0207
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0207
     * @tc.desc      new DslCss("abcabc", "aa", 3, " a ", "abc_1", 2, -13, "", 35, 1, 5, 30, "123") initialises 10 pu...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0207 begin`);
      const subject: DslCss = new DslCss('abcabc', 'aa', 3, ' a ', 'abc_1', 2, -13, '', 35, 1, 5, 30, '123');
      logInfo(`new DslCss("abcabc", "aa", 3, " a ", "abc...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('abcabc');
      logInfo(`new DslCss("abcabc", "aa", 3, " a ", "abc...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('aa');
      logInfo(`new DslCss("abcabc", "aa", 3, " a ", "abc...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(3);
      logInfo(`new DslCss("abcabc", "aa", 3, " a ", "abc...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual(' a ');
      logInfo(`new DslCss("abcabc", "aa", 3, " a ", "abc...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('abc_1');
      logInfo(`new DslCss("abcabc", "aa", 3, " a ", "abc...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(2);
      logInfo(`new DslCss("abcabc", "aa", 3, " a ", "abc...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(-13);
      logInfo(`new DslCss("abcabc", "aa", 3, " a ", "abc...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("abcabc", "aa", 3, " a ", "abc...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(35);
      logInfo(`new DslCss("abcabc", "aa", 3, " a ", "abc...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(1);
      logInfo(`${BUNDLE}DslCssCtor_0207 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0208
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0208
     * @tc.desc      new DslCss(" ", "123", 2, "a_1", "xabc", -1, 30, "xa", -1, 10, 5, 0, "") initialises 10 public m...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0208 begin`);
      const subject: DslCss = new DslCss(' ', '123', 2, 'a_1', 'xabc', -1, 30, 'xa', -1, 10, 5, 0, '');
      logInfo(`new DslCss(" ", "123", 2, "a_1", "xabc", ...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual(' ');
      logInfo(`new DslCss(" ", "123", 2, "a_1", "xabc", ...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('123');
      logInfo(`new DslCss(" ", "123", 2, "a_1", "xabc", ...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(2);
      logInfo(`new DslCss(" ", "123", 2, "a_1", "xabc", ...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('a_1');
      logInfo(`new DslCss(" ", "123", 2, "a_1", "xabc", ...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('xabc');
      logInfo(`new DslCss(" ", "123", 2, "a_1", "xabc", ...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(-1);
      logInfo(`new DslCss(" ", "123", 2, "a_1", "xabc", ...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(30);
      logInfo(`new DslCss(" ", "123", 2, "a_1", "xabc", ...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('xa');
      logInfo(`new DslCss(" ", "123", 2, "a_1", "xabc", ...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-1);
      logInfo(`new DslCss(" ", "123", 2, "a_1", "xabc", ...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(10);
      logInfo(`${BUNDLE}DslCssCtor_0208 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0209
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0209
     * @tc.desc      new DslCss(" abc ", "abc", 5, "Hello World", "abcabc", 500, 10, " ", 5, 5, 1, 2, "abc") initiali...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0209 begin`);
      const subject: DslCss = new DslCss(' abc ', 'abc', 5, 'Hello World', 'abcabc', 500, 10, ' ', 5, 5, 1, 2, 'abc');
      logInfo(`new DslCss(" abc ", "abc", 5, "Hello Worl...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual(' abc ');
      logInfo(`new DslCss(" abc ", "abc", 5, "Hello Worl...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('abc');
      logInfo(`new DslCss(" abc ", "abc", 5, "Hello Worl...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(5);
      logInfo(`new DslCss(" abc ", "abc", 5, "Hello Worl...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('Hello World');
      logInfo(`new DslCss(" abc ", "abc", 5, "Hello Worl...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('abcabc');
      logInfo(`new DslCss(" abc ", "abc", 5, "Hello Worl...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(500);
      logInfo(`new DslCss(" abc ", "abc", 5, "Hello Worl...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(10);
      logInfo(`new DslCss(" abc ", "abc", 5, "Hello Worl...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual(' ');
      logInfo(`new DslCss(" abc ", "abc", 5, "Hello Worl...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(5);
      logInfo(`new DslCss(" abc ", "abc", 5, "Hello Worl...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(5);
      logInfo(`${BUNDLE}DslCssCtor_0209 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0210
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0210
     * @tc.desc      new DslCss("a_1", "", 51, "a", " ", 100, 20, "", 85, 15, 20, 10, "") initialises 10 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0210 begin`);
      const subject: DslCss = new DslCss('a_1', '', 51, 'a', ' ', 100, 20, '', 85, 15, 20, 10, '');
      logInfo(`new DslCss("a_1", "", 51, "a", " ", 100, ...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('a_1');
      logInfo(`new DslCss("a_1", "", 51, "a", " ", 100, ...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("a_1", "", 51, "a", " ", 100, ...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(51);
      logInfo(`new DslCss("a_1", "", 51, "a", " ", 100, ...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('a');
      logInfo(`new DslCss("a_1", "", 51, "a", " ", 100, ...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual(' ');
      logInfo(`new DslCss("a_1", "", 51, "a", " ", 100, ...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(100);
      logInfo(`new DslCss("a_1", "", 51, "a", " ", 100, ...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(20);
      logInfo(`new DslCss("a_1", "", 51, "a", " ", 100, ...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("a_1", "", 51, "a", " ", 100, ...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(85);
      logInfo(`new DslCss("a_1", "", 51, "a", " ", 100, ...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(15);
      logInfo(`${BUNDLE}DslCssCtor_0210 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0211
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0211
     * @tc.desc      new DslCss(" ", "Hello World", -1, "", "123", 50, 0, "abc_1", 2, 50, 25, 30, "") initialises 10 ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0211 begin`);
      const subject: DslCss = new DslCss(' ', 'Hello World', -1, '', '123', 50, 0, 'abc_1', 2, 50, 25, 30, '');
      logInfo(`new DslCss(" ", "Hello World", -1, "", "1...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual(' ');
      logInfo(`new DslCss(" ", "Hello World", -1, "", "1...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('Hello World');
      logInfo(`new DslCss(" ", "Hello World", -1, "", "1...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(-1);
      logInfo(`new DslCss(" ", "Hello World", -1, "", "1...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss(" ", "Hello World", -1, "", "1...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('123');
      logInfo(`new DslCss(" ", "Hello World", -1, "", "1...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(50);
      logInfo(`new DslCss(" ", "Hello World", -1, "", "1...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss(" ", "Hello World", -1, "", "1...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('abc_1');
      logInfo(`new DslCss(" ", "Hello World", -1, "", "1...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(2);
      logInfo(`new DslCss(" ", "Hello World", -1, "", "1...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(50);
      logInfo(`${BUNDLE}DslCssCtor_0211 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0212
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0212
     * @tc.desc      new DslCss(" ", "abc_1", 51, "abcabc", "abc", 2, -13, "", 85, 20, 50, 0, "HelloHello") initialis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0212 begin`);
      const subject: DslCss = new DslCss(' ', 'abc_1', 51, 'abcabc', 'abc', 2, -13, '', 85, 20, 50, 0, 'HelloHello');
      logInfo(`new DslCss(" ", "abc_1", 51, "abcabc", "a...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual(' ');
      logInfo(`new DslCss(" ", "abc_1", 51, "abcabc", "a...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('abc_1');
      logInfo(`new DslCss(" ", "abc_1", 51, "abcabc", "a...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(51);
      logInfo(`new DslCss(" ", "abc_1", 51, "abcabc", "a...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('abcabc');
      logInfo(`new DslCss(" ", "abc_1", 51, "abcabc", "a...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('abc');
      logInfo(`new DslCss(" ", "abc_1", 51, "abcabc", "a...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(2);
      logInfo(`new DslCss(" ", "abc_1", 51, "abcabc", "a...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(-13);
      logInfo(`new DslCss(" ", "abc_1", 51, "abcabc", "a...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss(" ", "abc_1", 51, "abcabc", "a...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(85);
      logInfo(`new DslCss(" ", "abc_1", 51, "abcabc", "a...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(20);
      logInfo(`${BUNDLE}DslCssCtor_0212 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0213
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0213
     * @tc.desc      new DslCss("abc", "xabc", 51, "xabc", " a ", 2, 0, "xabc", 0, 0, 5, 100, "??") initialises 10 pu...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0213 begin`);
      const subject: DslCss = new DslCss('abc', 'xabc', 51, 'xabc', ' a ', 2, 0, 'xabc', 0, 0, 5, 100, '\u4e2d\u6587');
      logInfo(`new DslCss("abc", "xabc", 51, "xabc", " a...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('abc');
      logInfo(`new DslCss("abc", "xabc", 51, "xabc", " a...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('xabc');
      logInfo(`new DslCss("abc", "xabc", 51, "xabc", " a...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(51);
      logInfo(`new DslCss("abc", "xabc", 51, "xabc", " a...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('xabc');
      logInfo(`new DslCss("abc", "xabc", 51, "xabc", " a...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual(' a ');
      logInfo(`new DslCss("abc", "xabc", 51, "xabc", " a...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(2);
      logInfo(`new DslCss("abc", "xabc", 51, "xabc", " a...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("abc", "xabc", 51, "xabc", " a...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('xabc');
      logInfo(`new DslCss("abc", "xabc", 51, "xabc", " a...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(0);
      logInfo(`new DslCss("abc", "xabc", 51, "xabc", " a...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(0);
      logInfo(`${BUNDLE}DslCssCtor_0213 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0214
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0214
     * @tc.desc      new DslCss("abc", "abc_1", 100, "a", "abc_1", 200, 30, "abc_1", -1, 15, 5, 100, "123") initialis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0214 begin`);
      const subject: DslCss = new DslCss('abc', 'abc_1', 100, 'a', 'abc_1', 200, 30, 'abc_1', -1, 15, 5, 100, '123');
      logInfo(`new DslCss("abc", "abc_1", 100, "a", "abc...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('abc');
      logInfo(`new DslCss("abc", "abc_1", 100, "a", "abc...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('abc_1');
      logInfo(`new DslCss("abc", "abc_1", 100, "a", "abc...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(100);
      logInfo(`new DslCss("abc", "abc_1", 100, "a", "abc...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('a');
      logInfo(`new DslCss("abc", "abc_1", 100, "a", "abc...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('abc_1');
      logInfo(`new DslCss("abc", "abc_1", 100, "a", "abc...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(200);
      logInfo(`new DslCss("abc", "abc_1", 100, "a", "abc...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(30);
      logInfo(`new DslCss("abc", "abc_1", 100, "a", "abc...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('abc_1');
      logInfo(`new DslCss("abc", "abc_1", 100, "a", "abc...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-1);
      logInfo(`new DslCss("abc", "abc_1", 100, "a", "abc...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(15);
      logInfo(`${BUNDLE}DslCssCtor_0214 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0215
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0215
     * @tc.desc      new DslCss("xa", " a ", 1, " a ", "abcabc", 401, 0.5, "123", 1, 0, 0, 100, "Hello_1") initialise...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0215 begin`);
      const subject: DslCss = new DslCss('xa', ' a ', 1, ' a ', 'abcabc', 401, 0.5, '123', 1, 0, 0, 100, 'Hello_1');
      logInfo(`new DslCss("xa", " a ", 1, " a ", "abcabc...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('xa');
      logInfo(`new DslCss("xa", " a ", 1, " a ", "abcabc...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual(' a ');
      logInfo(`new DslCss("xa", " a ", 1, " a ", "abcabc...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(1);
      logInfo(`new DslCss("xa", " a ", 1, " a ", "abcabc...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual(' a ');
      logInfo(`new DslCss("xa", " a ", 1, " a ", "abcabc...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('abcabc');
      logInfo(`new DslCss("xa", " a ", 1, " a ", "abcabc...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(401);
      logInfo(`new DslCss("xa", " a ", 1, " a ", "abcabc...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertClose(0.5, PRECISION);
      logInfo(`new DslCss("xa", " a ", 1, " a ", "abcabc...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('123');
      logInfo(`new DslCss("xa", " a ", 1, " a ", "abcabc...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(1);
      logInfo(`new DslCss("xa", " a ", 1, " a ", "abcabc...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(0);
      logInfo(`${BUNDLE}DslCssCtor_0215 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0216
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0216
     * @tc.desc      new DslCss("a", " ", -1, "xa", "xa", -1, 0.25, "Hello World", 5, 5, -100, 0, " Hello ") initiali...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0216 begin`);
      const subject: DslCss = new DslCss('a', ' ', -1, 'xa', 'xa', -1, 0.25, 'Hello World', 5, 5, -100, 0, ' Hello ');
      logInfo(`new DslCss("a", " ", -1, "xa", "xa", -1, ...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('a');
      logInfo(`new DslCss("a", " ", -1, "xa", "xa", -1, ...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual(' ');
      logInfo(`new DslCss("a", " ", -1, "xa", "xa", -1, ...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(-1);
      logInfo(`new DslCss("a", " ", -1, "xa", "xa", -1, ...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('xa');
      logInfo(`new DslCss("a", " ", -1, "xa", "xa", -1, ...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('xa');
      logInfo(`new DslCss("a", " ", -1, "xa", "xa", -1, ...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(-1);
      logInfo(`new DslCss("a", " ", -1, "xa", "xa", -1, ...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertClose(0.25, PRECISION);
      logInfo(`new DslCss("a", " ", -1, "xa", "xa", -1, ...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('Hello World');
      logInfo(`new DslCss("a", " ", -1, "xa", "xa", -1, ...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(5);
      logInfo(`new DslCss("a", " ", -1, "xa", "xa", -1, ...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(5);
      logInfo(`${BUNDLE}DslCssCtor_0216 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0217
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0217
     * @tc.desc      new DslCss("aa", "Hello World", 35, " ", "abc_1", 100, 15, "aa", 30, 0, 3, 30, "HelloHello") ini...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0217 begin`);
      const subject: DslCss = new DslCss('aa', 'Hello World', 35, ' ', 'abc_1', 100, 15, 'aa', 30, 0, 3, 30,
        'HelloHello');
      logInfo(`new DslCss("aa", "Hello World", 35, " ", ...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('aa');
      logInfo(`new DslCss("aa", "Hello World", 35, " ", ...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('Hello World');
      logInfo(`new DslCss("aa", "Hello World", 35, " ", ...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(35);
      logInfo(`new DslCss("aa", "Hello World", 35, " ", ...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual(' ');
      logInfo(`new DslCss("aa", "Hello World", 35, " ", ...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('abc_1');
      logInfo(`new DslCss("aa", "Hello World", 35, " ", ...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(100);
      logInfo(`new DslCss("aa", "Hello World", 35, " ", ...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(15);
      logInfo(`new DslCss("aa", "Hello World", 35, " ", ...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('aa');
      logInfo(`new DslCss("aa", "Hello World", 35, " ", ...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(30);
      logInfo(`new DslCss("aa", "Hello World", 35, " ", ...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(0);
      logInfo(`${BUNDLE}DslCssCtor_0217 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0218
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0218
     * @tc.desc      new DslCss("abcabc", "Hello World", 1, "abcabc", "aa", 991, 10, " a ", -100, 100, 3, -1, "123") ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0218 begin`);
      const subject: DslCss = new DslCss('abcabc', 'Hello World', 1, 'abcabc', 'aa', 991, 10, ' a ', -100, 100, 3, -1,
        '123');
      logInfo(`new DslCss("abcabc", "Hello World", 1, "a...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('abcabc');
      logInfo(`new DslCss("abcabc", "Hello World", 1, "a...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('Hello World');
      logInfo(`new DslCss("abcabc", "Hello World", 1, "a...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(1);
      logInfo(`new DslCss("abcabc", "Hello World", 1, "a...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('abcabc');
      logInfo(`new DslCss("abcabc", "Hello World", 1, "a...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('aa');
      logInfo(`new DslCss("abcabc", "Hello World", 1, "a...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(991);
      logInfo(`new DslCss("abcabc", "Hello World", 1, "a...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(10);
      logInfo(`new DslCss("abcabc", "Hello World", 1, "a...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual(' a ');
      logInfo(`new DslCss("abcabc", "Hello World", 1, "a...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("abcabc", "Hello World", 1, "a...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(100);
      logInfo(`${BUNDLE}DslCssCtor_0218 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0219
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0219
     * @tc.desc      new DslCss("abc_1", "xa", 51, " a ", "xa", 100, 0.25, "a_1", 5, 35, 5, -100, "Sample Title 123")...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0219 begin`);
      const subject: DslCss = new DslCss('abc_1', 'xa', 51, ' a ', 'xa', 100, 0.25, 'a_1', 5, 35, 5, -100,
        'Sample Title 123');
      logInfo(`new DslCss("abc_1", "xa", 51, " a ", "xa"...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('abc_1');
      logInfo(`new DslCss("abc_1", "xa", 51, " a ", "xa"...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('xa');
      logInfo(`new DslCss("abc_1", "xa", 51, " a ", "xa"...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(51);
      logInfo(`new DslCss("abc_1", "xa", 51, " a ", "xa"...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual(' a ');
      logInfo(`new DslCss("abc_1", "xa", 51, " a ", "xa"...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('xa');
      logInfo(`new DslCss("abc_1", "xa", 51, " a ", "xa"...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(100);
      logInfo(`new DslCss("abc_1", "xa", 51, " a ", "xa"...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertClose(0.25, PRECISION);
      logInfo(`new DslCss("abc_1", "xa", 51, " a ", "xa"...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('a_1');
      logInfo(`new DslCss("abc_1", "xa", 51, " a ", "xa"...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(5);
      logInfo(`new DslCss("abc_1", "xa", 51, " a ", "xa"...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(35);
      logInfo(`${BUNDLE}DslCssCtor_0219 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0220
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0220
     * @tc.desc      new DslCss("xabc", "xa", 20, "a_1", " a ", 125, 1, "xa", 1, 25, 78.2, -100, " ") initialises 10 ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0220 begin`);
      const subject: DslCss = new DslCss('xabc', 'xa', 20, 'a_1', ' a ', 125, 1, 'xa', 1, 25, 78.2, -100, ' ');
      logInfo(`new DslCss("xabc", "xa", 20, "a_1", " a "...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('xabc');
      logInfo(`new DslCss("xabc", "xa", 20, "a_1", " a "...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('xa');
      logInfo(`new DslCss("xabc", "xa", 20, "a_1", " a "...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(20);
      logInfo(`new DslCss("xabc", "xa", 20, "a_1", " a "...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('a_1');
      logInfo(`new DslCss("xabc", "xa", 20, "a_1", " a "...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual(' a ');
      logInfo(`new DslCss("xabc", "xa", 20, "a_1", " a "...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(125);
      logInfo(`new DslCss("xabc", "xa", 20, "a_1", " a "...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(1);
      logInfo(`new DslCss("xabc", "xa", 20, "a_1", " a "...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('xa');
      logInfo(`new DslCss("xabc", "xa", 20, "a_1", " a "...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(1);
      logInfo(`new DslCss("xabc", "xa", 20, "a_1", " a "...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(25);
      logInfo(`${BUNDLE}DslCssCtor_0220 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0221
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0221
     * @tc.desc      new DslCss("Hello World", "a_1", 5, "", "Hello World", 10, -13, "abc", 25, 100, 78.2, 30, "A") i...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0221 begin`);
      const subject: DslCss = new DslCss('Hello World', 'a_1', 5, '', 'Hello World', 10, -13, 'abc', 25, 100, 78.2, 30,
        'A');
      logInfo(`new DslCss("Hello World", "a_1", 5, "", "...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('Hello World');
      logInfo(`new DslCss("Hello World", "a_1", 5, "", "...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('a_1');
      logInfo(`new DslCss("Hello World", "a_1", 5, "", "...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(5);
      logInfo(`new DslCss("Hello World", "a_1", 5, "", "...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("Hello World", "a_1", 5, "", "...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('Hello World');
      logInfo(`new DslCss("Hello World", "a_1", 5, "", "...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(10);
      logInfo(`new DslCss("Hello World", "a_1", 5, "", "...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(-13);
      logInfo(`new DslCss("Hello World", "a_1", 5, "", "...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('abc');
      logInfo(`new DslCss("Hello World", "a_1", 5, "", "...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(25);
      logInfo(`new DslCss("Hello World", "a_1", 5, "", "...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(100);
      logInfo(`${BUNDLE}DslCssCtor_0221 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0222
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0222
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 0, "", -100, -100, -1, -100, "Hello") initialises 10 public mem...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0222 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 0, '', -100, -100, -1, -100, 'Hello');
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
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0222 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0223
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0223
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 0, "", -100, -100, 0, -100, "Hello") initialises 10 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0223 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 0, '', -100, -100, 0, -100, 'Hello');
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
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0223 end`);
    });
  });
}
