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

/** Logic checks for new DslCss (45 cases). */
export default function dslCssCtor2Test(): void {
  describe('DslCssCtor2Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0046
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0046
     * @tc.desc      new DslCss("", "", 0, " ", "", 0, 0, "", -100, -100, -100, -100, "Hello") initialises 10 public ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0046 begin`);
      const subject: DslCss = new DslCss('', '', 0, ' ', '', 0, 0, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 0, " ", "", 0, 0, "", ...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 0, " ", "", 0, 0, "", ...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 0, " ", "", 0, 0, "", ...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "", 0, " ", "", 0, 0, "", ...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual(' ');
      logInfo(`new DslCss("", "", 0, " ", "", 0, 0, "", ...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, " ", "", 0, 0, "", ...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "", 0, " ", "", 0, 0, "", ...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "", 0, " ", "", 0, 0, "", ...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "", 0, " ", "", 0, 0, "", ...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "", 0, " ", "", 0, 0, "", ...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0046 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0047
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0047
     * @tc.desc      new DslCss("", "", 0, "123", "", 0, 0, "", -100, -100, -100, -100, "Hello") initialises 10 publi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0047 begin`);
      const subject: DslCss = new DslCss('', '', 0, '123', '', 0, 0, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 0, "123", "", 0, 0, ""...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 0, "123", "", 0, 0, ""...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 0, "123", "", 0, 0, ""...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "123", "", 0, 0, ""...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('123');
      logInfo(`new DslCss("", "", 0, "123", "", 0, 0, ""...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "123", "", 0, 0, ""...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "123", "", 0, 0, ""...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "123", "", 0, 0, ""...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "", 0, "123", "", 0, 0, ""...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "", 0, "123", "", 0, 0, ""...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0047 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0048
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0048
     * @tc.desc      new DslCss("", "", 0, " a ", "", 0, 0, "", -100, -100, -100, -100, "Hello") initialises 10 publi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0048 begin`);
      const subject: DslCss = new DslCss('', '', 0, ' a ', '', 0, 0, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 0, " a ", "", 0, 0, ""...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 0, " a ", "", 0, 0, ""...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 0, " a ", "", 0, 0, ""...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "", 0, " a ", "", 0, 0, ""...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual(' a ');
      logInfo(`new DslCss("", "", 0, " a ", "", 0, 0, ""...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, " a ", "", 0, 0, ""...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "", 0, " a ", "", 0, 0, ""...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "", 0, " a ", "", 0, 0, ""...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "", 0, " a ", "", 0, 0, ""...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "", 0, " a ", "", 0, 0, ""...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0048 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0049
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0049
     * @tc.desc      new DslCss("", "", 0, "aa", "", 0, 0, "", -100, -100, -100, -100, "Hello") initialises 10 public...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0049 begin`);
      const subject: DslCss = new DslCss('', '', 0, 'aa', '', 0, 0, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 0, "aa", "", 0, 0, "",...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 0, "aa", "", 0, 0, "",...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 0, "aa", "", 0, 0, "",...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "aa", "", 0, 0, "",...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('aa');
      logInfo(`new DslCss("", "", 0, "aa", "", 0, 0, "",...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "aa", "", 0, 0, "",...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "aa", "", 0, 0, "",...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "aa", "", 0, 0, "",...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "", 0, "aa", "", 0, 0, "",...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "", 0, "aa", "", 0, 0, "",...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0049 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0050
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0050
     * @tc.desc      new DslCss("", "", 0, "a_1", "", 0, 0, "", -100, -100, -100, -100, "Hello") initialises 10 publi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0050 begin`);
      const subject: DslCss = new DslCss('', '', 0, 'a_1', '', 0, 0, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 0, "a_1", "", 0, 0, ""...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 0, "a_1", "", 0, 0, ""...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 0, "a_1", "", 0, 0, ""...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "a_1", "", 0, 0, ""...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('a_1');
      logInfo(`new DslCss("", "", 0, "a_1", "", 0, 0, ""...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "a_1", "", 0, 0, ""...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "a_1", "", 0, 0, ""...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "a_1", "", 0, 0, ""...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "", 0, "a_1", "", 0, 0, ""...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "", 0, "a_1", "", 0, 0, ""...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0050 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0051
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0051
     * @tc.desc      new DslCss("", "", 0, "xa", "", 0, 0, "", -100, -100, -100, -100, "Hello") initialises 10 public...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0051 begin`);
      const subject: DslCss = new DslCss('', '', 0, 'xa', '', 0, 0, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 0, "xa", "", 0, 0, "",...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 0, "xa", "", 0, 0, "",...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 0, "xa", "", 0, 0, "",...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "xa", "", 0, 0, "",...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('xa');
      logInfo(`new DslCss("", "", 0, "xa", "", 0, 0, "",...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "xa", "", 0, 0, "",...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "xa", "", 0, 0, "",...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "xa", "", 0, 0, "",...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "", 0, "xa", "", 0, 0, "",...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "", 0, "xa", "", 0, 0, "",...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0051 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0052
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0052
     * @tc.desc      new DslCss("", "", 0, " abc ", "", 0, 0, "", -100, -100, -100, -100, "Hello") initialises 10 pub...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0052 begin`);
      const subject: DslCss = new DslCss('', '', 0, ' abc ', '', 0, 0, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 0, " abc ", "", 0, 0, ...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 0, " abc ", "", 0, 0, ...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 0, " abc ", "", 0, 0, ...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "", 0, " abc ", "", 0, 0, ...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual(' abc ');
      logInfo(`new DslCss("", "", 0, " abc ", "", 0, 0, ...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, " abc ", "", 0, 0, ...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "", 0, " abc ", "", 0, 0, ...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "", 0, " abc ", "", 0, 0, ...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "", 0, " abc ", "", 0, 0, ...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "", 0, " abc ", "", 0, 0, ...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0052 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0053
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0053
     * @tc.desc      new DslCss("", "", 0, "abcabc", "", 0, 0, "", -100, -100, -100, -100, "Hello") initialises 10 pu...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0053 begin`);
      const subject: DslCss = new DslCss('', '', 0, 'abcabc', '', 0, 0, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 0, "abcabc", "", 0, 0,...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 0, "abcabc", "", 0, 0,...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 0, "abcabc", "", 0, 0,...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "abcabc", "", 0, 0,...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('abcabc');
      logInfo(`new DslCss("", "", 0, "abcabc", "", 0, 0,...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "abcabc", "", 0, 0,...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "abcabc", "", 0, 0,...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "abcabc", "", 0, 0,...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "", 0, "abcabc", "", 0, 0,...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "", 0, "abcabc", "", 0, 0,...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0053 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0054
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0054
     * @tc.desc      new DslCss("", "", 0, "abc_1", "", 0, 0, "", -100, -100, -100, -100, "Hello") initialises 10 pub...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0054 begin`);
      const subject: DslCss = new DslCss('', '', 0, 'abc_1', '', 0, 0, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 0, "abc_1", "", 0, 0, ...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 0, "abc_1", "", 0, 0, ...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 0, "abc_1", "", 0, 0, ...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "abc_1", "", 0, 0, ...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('abc_1');
      logInfo(`new DslCss("", "", 0, "abc_1", "", 0, 0, ...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "abc_1", "", 0, 0, ...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "abc_1", "", 0, 0, ...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "abc_1", "", 0, 0, ...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "", 0, "abc_1", "", 0, 0, ...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "", 0, "abc_1", "", 0, 0, ...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0054 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0055
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0055
     * @tc.desc      new DslCss("", "", 0, "xabc", "", 0, 0, "", -100, -100, -100, -100, "Hello") initialises 10 publ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0055 begin`);
      const subject: DslCss = new DslCss('', '', 0, 'xabc', '', 0, 0, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 0, "xabc", "", 0, 0, "...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 0, "xabc", "", 0, 0, "...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 0, "xabc", "", 0, 0, "...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "xabc", "", 0, 0, "...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('xabc');
      logInfo(`new DslCss("", "", 0, "xabc", "", 0, 0, "...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "xabc", "", 0, 0, "...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "xabc", "", 0, 0, "...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "xabc", "", 0, 0, "...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "", 0, "xabc", "", 0, 0, "...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "", 0, "xabc", "", 0, 0, "...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0055 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0056
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0056
     * @tc.desc      new DslCss("", "", 0, "", "a", 0, 0, "", -100, -100, -100, -100, "Hello") initialises 10 public ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0056 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', 'a', 0, 0, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 0, "", "a", 0, 0, "", ...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "a", 0, 0, "", ...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "a", 0, 0, "", ...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "a", 0, 0, "", ...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "a", 0, 0, "", ...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('a');
      logInfo(`new DslCss("", "", 0, "", "a", 0, 0, "", ...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "a", 0, 0, "", ...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "a", 0, 0, "", ...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "a", 0, 0, "", ...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "", 0, "", "a", 0, 0, "", ...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0056 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0057
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0057
     * @tc.desc      new DslCss("", "", 0, "", "abc", 0, 0, "", -100, -100, -100, -100, "Hello") initialises 10 publi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0057 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', 'abc', 0, 0, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 0, "", "abc", 0, 0, ""...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "abc", 0, 0, ""...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "abc", 0, 0, ""...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "abc", 0, 0, ""...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "abc", 0, 0, ""...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('abc');
      logInfo(`new DslCss("", "", 0, "", "abc", 0, 0, ""...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "abc", 0, 0, ""...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "abc", 0, 0, ""...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "abc", 0, 0, ""...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "", 0, "", "abc", 0, 0, ""...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0057 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0058
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0058
     * @tc.desc      new DslCss("", "", 0, "", "Hello World", 0, 0, "", -100, -100, -100, -100, "Hello") initialises ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0058 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', 'Hello World', 0, 0, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 0, "", "Hello World", ...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "Hello World", ...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "Hello World", ...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "Hello World", ...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "Hello World", ...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('Hello World');
      logInfo(`new DslCss("", "", 0, "", "Hello World", ...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "Hello World", ...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "Hello World", ...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "Hello World", ...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "", 0, "", "Hello World", ...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0058 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0059
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0059
     * @tc.desc      new DslCss("", "", 0, "", " ", 0, 0, "", -100, -100, -100, -100, "Hello") initialises 10 public ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0059 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', ' ', 0, 0, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 0, "", " ", 0, 0, "", ...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", " ", 0, 0, "", ...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", " ", 0, 0, "", ...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", " ", 0, 0, "", ...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", " ", 0, 0, "", ...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual(' ');
      logInfo(`new DslCss("", "", 0, "", " ", 0, 0, "", ...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", " ", 0, 0, "", ...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", " ", 0, 0, "", ...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", " ", 0, 0, "", ...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "", 0, "", " ", 0, 0, "", ...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0059 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0060
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0060
     * @tc.desc      new DslCss("", "", 0, "", "123", 0, 0, "", -100, -100, -100, -100, "Hello") initialises 10 publi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0060 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '123', 0, 0, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 0, "", "123", 0, 0, ""...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "123", 0, 0, ""...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "123", 0, 0, ""...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "123", 0, 0, ""...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "123", 0, 0, ""...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('123');
      logInfo(`new DslCss("", "", 0, "", "123", 0, 0, ""...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "123", 0, 0, ""...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "123", 0, 0, ""...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "123", 0, 0, ""...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "", 0, "", "123", 0, 0, ""...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0060 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0061
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0061
     * @tc.desc      new DslCss("", "", 0, "", " a ", 0, 0, "", -100, -100, -100, -100, "Hello") initialises 10 publi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0061 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', ' a ', 0, 0, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 0, "", " a ", 0, 0, ""...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", " a ", 0, 0, ""...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", " a ", 0, 0, ""...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", " a ", 0, 0, ""...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", " a ", 0, 0, ""...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual(' a ');
      logInfo(`new DslCss("", "", 0, "", " a ", 0, 0, ""...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", " a ", 0, 0, ""...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", " a ", 0, 0, ""...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", " a ", 0, 0, ""...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "", 0, "", " a ", 0, 0, ""...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0061 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0062
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0062
     * @tc.desc      new DslCss("", "", 0, "", "aa", 0, 0, "", -100, -100, -100, -100, "Hello") initialises 10 public...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0062 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', 'aa', 0, 0, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 0, "", "aa", 0, 0, "",...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "aa", 0, 0, "",...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "aa", 0, 0, "",...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "aa", 0, 0, "",...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "aa", 0, 0, "",...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('aa');
      logInfo(`new DslCss("", "", 0, "", "aa", 0, 0, "",...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "aa", 0, 0, "",...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "aa", 0, 0, "",...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "aa", 0, 0, "",...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "", 0, "", "aa", 0, 0, "",...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0062 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0063
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0063
     * @tc.desc      new DslCss("", "", 0, "", "a_1", 0, 0, "", -100, -100, -100, -100, "Hello") initialises 10 publi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0063 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', 'a_1', 0, 0, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 0, "", "a_1", 0, 0, ""...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "a_1", 0, 0, ""...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "a_1", 0, 0, ""...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "a_1", 0, 0, ""...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "a_1", 0, 0, ""...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('a_1');
      logInfo(`new DslCss("", "", 0, "", "a_1", 0, 0, ""...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "a_1", 0, 0, ""...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "a_1", 0, 0, ""...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "a_1", 0, 0, ""...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "", 0, "", "a_1", 0, 0, ""...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0063 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0064
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0064
     * @tc.desc      new DslCss("", "", 0, "", "xa", 0, 0, "", -100, -100, -100, -100, "Hello") initialises 10 public...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0064 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', 'xa', 0, 0, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 0, "", "xa", 0, 0, "",...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "xa", 0, 0, "",...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "xa", 0, 0, "",...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "xa", 0, 0, "",...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "xa", 0, 0, "",...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('xa');
      logInfo(`new DslCss("", "", 0, "", "xa", 0, 0, "",...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "xa", 0, 0, "",...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "xa", 0, 0, "",...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "xa", 0, 0, "",...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "", 0, "", "xa", 0, 0, "",...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0064 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0065
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0065
     * @tc.desc      new DslCss("", "", 0, "", " abc ", 0, 0, "", -100, -100, -100, -100, "Hello") initialises 10 pub...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0065 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', ' abc ', 0, 0, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 0, "", " abc ", 0, 0, ...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", " abc ", 0, 0, ...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", " abc ", 0, 0, ...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", " abc ", 0, 0, ...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", " abc ", 0, 0, ...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual(' abc ');
      logInfo(`new DslCss("", "", 0, "", " abc ", 0, 0, ...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", " abc ", 0, 0, ...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", " abc ", 0, 0, ...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", " abc ", 0, 0, ...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "", 0, "", " abc ", 0, 0, ...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0065 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0066
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0066
     * @tc.desc      new DslCss("", "", 0, "", "abcabc", 0, 0, "", -100, -100, -100, -100, "Hello") initialises 10 pu...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0066 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', 'abcabc', 0, 0, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 0, "", "abcabc", 0, 0,...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "abcabc", 0, 0,...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "abcabc", 0, 0,...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "abcabc", 0, 0,...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "abcabc", 0, 0,...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('abcabc');
      logInfo(`new DslCss("", "", 0, "", "abcabc", 0, 0,...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "abcabc", 0, 0,...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "abcabc", 0, 0,...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "abcabc", 0, 0,...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "", 0, "", "abcabc", 0, 0,...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0066 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0067
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0067
     * @tc.desc      new DslCss("", "", 0, "", "abc_1", 0, 0, "", -100, -100, -100, -100, "Hello") initialises 10 pub...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0067 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', 'abc_1', 0, 0, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 0, "", "abc_1", 0, 0, ...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "abc_1", 0, 0, ...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "abc_1", 0, 0, ...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "abc_1", 0, 0, ...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "abc_1", 0, 0, ...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('abc_1');
      logInfo(`new DslCss("", "", 0, "", "abc_1", 0, 0, ...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "abc_1", 0, 0, ...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "abc_1", 0, 0, ...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "abc_1", 0, 0, ...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "", 0, "", "abc_1", 0, 0, ...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0067 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0068
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0068
     * @tc.desc      new DslCss("", "", 0, "", "xabc", 0, 0, "", -100, -100, -100, -100, "Hello") initialises 10 publ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0068 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', 'xabc', 0, 0, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 0, "", "xabc", 0, 0, "...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "xabc", 0, 0, "...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "xabc", 0, 0, "...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "xabc", 0, 0, "...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "xabc", 0, 0, "...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('xabc');
      logInfo(`new DslCss("", "", 0, "", "xabc", 0, 0, "...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "xabc", 0, 0, "...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "xabc", 0, 0, "...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "xabc", 0, 0, "...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "", 0, "", "xabc", 0, 0, "...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0068 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0069
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0069
     * @tc.desc      new DslCss("", "", 0, "", "", 200, 0, "", -100, -100, -100, -100, "Hello") initialises 10 public...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0069 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 200, 0, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 0, "", "", 200, 0, "",...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 200, 0, "",...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 200, 0, "",...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 200, 0, "",...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 200, 0, "",...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 200, 0, "",...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(200);
      logInfo(`new DslCss("", "", 0, "", "", 200, 0, "",...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 200, 0, "",...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 200, 0, "",...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "", 0, "", "", 200, 0, "",...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0069 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0070
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0070
     * @tc.desc      new DslCss("", "", 0, "", "", 401, 0, "", -100, -100, -100, -100, "Hello") initialises 10 public...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0070 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 401, 0, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 0, "", "", 401, 0, "",...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 401, 0, "",...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 401, 0, "",...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 401, 0, "",...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 401, 0, "",...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 401, 0, "",...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(401);
      logInfo(`new DslCss("", "", 0, "", "", 401, 0, "",...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 401, 0, "",...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 401, 0, "",...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "", 0, "", "", 401, 0, "",...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0070 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0071
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0071
     * @tc.desc      new DslCss("", "", 0, "", "", 404, 0, "", -100, -100, -100, -100, "Hello") initialises 10 public...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0071 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 404, 0, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 0, "", "", 404, 0, "",...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 404, 0, "",...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 404, 0, "",...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 404, 0, "",...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 404, 0, "",...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 404, 0, "",...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(404);
      logInfo(`new DslCss("", "", 0, "", "", 404, 0, "",...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 404, 0, "",...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 404, 0, "",...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "", 0, "", "", 404, 0, "",...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0071 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0072
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0072
     * @tc.desc      new DslCss("", "", 0, "", "", 500, 0, "", -100, -100, -100, -100, "Hello") initialises 10 public...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0072 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 500, 0, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 0, "", "", 500, 0, "",...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 500, 0, "",...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 500, 0, "",...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 500, 0, "",...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 500, 0, "",...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 500, 0, "",...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(500);
      logInfo(`new DslCss("", "", 0, "", "", 500, 0, "",...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 500, 0, "",...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 500, 0, "",...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "", 0, "", "", 500, 0, "",...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0072 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0073
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0073
     * @tc.desc      new DslCss("", "", 0, "", "", -1, 0, "", -100, -100, -100, -100, "Hello") initialises 10 public ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0073 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', -1, 0, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 0, "", "", -1, 0, "", ...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", -1, 0, "", ...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", -1, 0, "", ...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", -1, 0, "", ...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", -1, 0, "", ...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", -1, 0, "", ...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(-1);
      logInfo(`new DslCss("", "", 0, "", "", -1, 0, "", ...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", -1, 0, "", ...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", -1, 0, "", ...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "", 0, "", "", -1, 0, "", ...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0073 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0074
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0074
     * @tc.desc      new DslCss("", "", 0, "", "", 1, 0, "", -100, -100, -100, -100, "Hello") initialises 10 public m...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0074 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 1, 0, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 0, "", "", 1, 0, "", -...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 1, 0, "", -...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 1, 0, "", -...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 1, 0, "", -...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 1, 0, "", -...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 1, 0, "", -...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(1);
      logInfo(`new DslCss("", "", 0, "", "", 1, 0, "", -...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 1, 0, "", -...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 1, 0, "", -...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "", 0, "", "", 1, 0, "", -...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0074 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0075
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0075
     * @tc.desc      new DslCss("", "", 0, "", "", 2, 0, "", -100, -100, -100, -100, "Hello") initialises 10 public m...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0075 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 2, 0, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 0, "", "", 2, 0, "", -...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 2, 0, "", -...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 2, 0, "", -...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 2, 0, "", -...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 2, 0, "", -...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 2, 0, "", -...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(2);
      logInfo(`new DslCss("", "", 0, "", "", 2, 0, "", -...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 2, 0, "", -...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 2, 0, "", -...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "", 0, "", "", 2, 0, "", -...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0075 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0076
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0076
     * @tc.desc      new DslCss("", "", 0, "", "", 3, 0, "", -100, -100, -100, -100, "Hello") initialises 10 public m...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0076 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 3, 0, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 0, "", "", 3, 0, "", -...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 3, 0, "", -...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 3, 0, "", -...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 3, 0, "", -...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 3, 0, "", -...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 3, 0, "", -...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(3);
      logInfo(`new DslCss("", "", 0, "", "", 3, 0, "", -...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 3, 0, "", -...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 3, 0, "", -...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "", 0, "", "", 3, 0, "", -...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0076 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0077
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0077
     * @tc.desc      new DslCss("", "", 0, "", "", 10, 0, "", -100, -100, -100, -100, "Hello") initialises 10 public ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0077 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 10, 0, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 0, "", "", 10, 0, "", ...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 10, 0, "", ...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 10, 0, "", ...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 10, 0, "", ...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 10, 0, "", ...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 10, 0, "", ...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(10);
      logInfo(`new DslCss("", "", 0, "", "", 10, 0, "", ...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 10, 0, "", ...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 10, 0, "", ...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "", 0, "", "", 10, 0, "", ...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0077 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0078
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0078
     * @tc.desc      new DslCss("", "", 0, "", "", 100, 0, "", -100, -100, -100, -100, "Hello") initialises 10 public...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0078 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 100, 0, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 0, "", "", 100, 0, "",...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 100, 0, "",...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 100, 0, "",...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 100, 0, "",...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 100, 0, "",...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 100, 0, "",...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(100);
      logInfo(`new DslCss("", "", 0, "", "", 100, 0, "",...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 100, 0, "",...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 100, 0, "",...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "", 0, "", "", 100, 0, "",...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0078 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0079
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0079
     * @tc.desc      new DslCss("", "", 0, "", "", 25, 0, "", -100, -100, -100, -100, "Hello") initialises 10 public ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0079 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 25, 0, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 0, "", "", 25, 0, "", ...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 25, 0, "", ...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 25, 0, "", ...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 25, 0, "", ...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 25, 0, "", ...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 25, 0, "", ...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(25);
      logInfo(`new DslCss("", "", 0, "", "", 25, 0, "", ...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 25, 0, "", ...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 25, 0, "", ...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "", 0, "", "", 25, 0, "", ...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0079 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0080
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0080
     * @tc.desc      new DslCss("", "", 0, "", "", 50, 0, "", -100, -100, -100, -100, "Hello") initialises 10 public ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0080 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 50, 0, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 0, "", "", 50, 0, "", ...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 50, 0, "", ...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 50, 0, "", ...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 50, 0, "", ...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 50, 0, "", ...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 50, 0, "", ...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(50);
      logInfo(`new DslCss("", "", 0, "", "", 50, 0, "", ...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 50, 0, "", ...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 50, 0, "", ...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "", 0, "", "", 50, 0, "", ...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0080 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0081
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0081
     * @tc.desc      new DslCss("", "", 0, "", "", 75, 0, "", -100, -100, -100, -100, "Hello") initialises 10 public ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0081 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 75, 0, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 0, "", "", 75, 0, "", ...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 75, 0, "", ...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 75, 0, "", ...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 75, 0, "", ...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 75, 0, "", ...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 75, 0, "", ...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(75);
      logInfo(`new DslCss("", "", 0, "", "", 75, 0, "", ...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 75, 0, "", ...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 75, 0, "", ...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "", 0, "", "", 75, 0, "", ...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0081 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0082
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0082
     * @tc.desc      new DslCss("", "", 0, "", "", 125, 0, "", -100, -100, -100, -100, "Hello") initialises 10 public...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0082 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 125, 0, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 0, "", "", 125, 0, "",...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 125, 0, "",...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 125, 0, "",...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 125, 0, "",...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 125, 0, "",...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 125, 0, "",...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(125);
      logInfo(`new DslCss("", "", 0, "", "", 125, 0, "",...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 125, 0, "",...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 125, 0, "",...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "", 0, "", "", 125, 0, "",...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0082 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0083
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0083
     * @tc.desc      new DslCss("", "", 0, "", "", 991, 0, "", -100, -100, -100, -100, "Hello") initialises 10 public...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0083 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 991, 0, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 0, "", "", 991, 0, "",...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 991, 0, "",...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 991, 0, "",...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 991, 0, "",...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 991, 0, "",...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 991, 0, "",...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(991);
      logInfo(`new DslCss("", "", 0, "", "", 991, 0, "",...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 991, 0, "",...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 991, 0, "",...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "", 0, "", "", 991, 0, "",...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0083 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0084
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0084
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 0.25, "", -100, -100, -100, -100, "Hello") initialises 10 publi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0084 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 0.25, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0.25, ""...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0.25, ""...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0.25, ""...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0.25, ""...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0.25, ""...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0.25, ""...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0.25, ""...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertClose(0.25, PRECISION);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0.25, ""...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0.25, ""...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0.25, ""...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0084 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0085
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0085
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 0.5, "", -100, -100, -100, -100, "Hello") initialises 10 public...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0085 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 0.5, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0.5, "",...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0.5, "",...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0.5, "",...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0.5, "",...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0.5, "",...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0.5, "",...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0.5, "",...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertClose(0.5, PRECISION);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0.5, "",...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0.5, "",...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0.5, "",...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0085 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0086
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0086
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 1, "", -100, -100, -100, -100, "Hello") initialises 10 public m...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0086 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 1, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 0, "", "", 0, 1, "", -...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 1, "", -...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 1, "", -...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 1, "", -...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 1, "", -...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 1, "", -...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 1, "", -...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(1);
      logInfo(`new DslCss("", "", 0, "", "", 0, 1, "", -...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 1, "", -...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "", 0, "", "", 0, 1, "", -...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0086 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0087
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0087
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 1.5, "", -100, -100, -100, -100, "Hello") initialises 10 public...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0087 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 1.5, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 0, "", "", 0, 1.5, "",...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 1.5, "",...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 1.5, "",...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 1.5, "",...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 1.5, "",...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 1.5, "",...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 1.5, "",...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertClose(1.5, PRECISION);
      logInfo(`new DslCss("", "", 0, "", "", 0, 1.5, "",...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 1.5, "",...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "", 0, "", "", 0, 1.5, "",...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0087 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0088
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0088
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 2, "", -100, -100, -100, -100, "Hello") initialises 10 public m...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0088 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 2, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 0, "", "", 0, 2, "", -...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 2, "", -...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 2, "", -...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 2, "", -...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 2, "", -...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 2, "", -...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 2, "", -...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(2);
      logInfo(`new DslCss("", "", 0, "", "", 0, 2, "", -...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 2, "", -...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "", 0, "", "", 0, 2, "", -...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0088 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0089
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0089
     * @tc.desc      new DslCss("", "", 0, "", "", 0, -1, "", -100, -100, -100, -100, "Hello") initialises 10 public ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0089 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, -1, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 0, "", "", 0, -1, "", ...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, -1, "", ...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, -1, "", ...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, -1, "", ...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, -1, "", ...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, -1, "", ...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, -1, "", ...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(-1);
      logInfo(`new DslCss("", "", 0, "", "", 0, -1, "", ...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, -1, "", ...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "", 0, "", "", 0, -1, "", ...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0089 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0090
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0090
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 3, "", -100, -100, -100, -100, "Hello") initialises 10 public m...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0090 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 3, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 0, "", "", 0, 3, "", -...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 3, "", -...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 3, "", -...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 3, "", -...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 3, "", -...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 3, "", -...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 3, "", -...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(3);
      logInfo(`new DslCss("", "", 0, "", "", 0, 3, "", -...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 3, "", -...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "", 0, "", "", 0, 3, "", -...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0090 end`);
    });
  });
}
