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

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for new DslCss (45 cases). */
export default function dslCssCtorTest(): void {
  describe('DslCssCtorTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0001
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0001
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 0, "", -100, -100, -100, -100, "Hello") initialises 10 public m...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DslCssCtor_0001 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 0, '', -100, -100, -100, -100, 'Hello');
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
      logInfo(`${BUNDLE}DslCssCtor_0001 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0002
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0002
     * @tc.desc      new DslCss("a", "", 0, "", "", 0, 0, "", -100, -100, -100, -100, "Hello") initialises 10 public ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DslCssCtor_0002 begin`);
      const subject: DslCss = new DslCss('a', '', 0, '', '', 0, 0, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("a", "", 0, "", "", 0, 0, "", ...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('a');
      logInfo(`new DslCss("a", "", 0, "", "", 0, 0, "", ...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("a", "", 0, "", "", 0, 0, "", ...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("a", "", 0, "", "", 0, 0, "", ...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("a", "", 0, "", "", 0, 0, "", ...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("a", "", 0, "", "", 0, 0, "", ...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("a", "", 0, "", "", 0, 0, "", ...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("a", "", 0, "", "", 0, 0, "", ...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("a", "", 0, "", "", 0, 0, "", ...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("a", "", 0, "", "", 0, 0, "", ...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0002 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0003
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0003
     * @tc.desc      new DslCss("abc", "", 0, "", "", 0, 0, "", -100, -100, -100, -100, "Hello") initialises 10 publi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0003 begin`);
      const subject: DslCss = new DslCss('abc', '', 0, '', '', 0, 0, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("abc", "", 0, "", "", 0, 0, ""...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('abc');
      logInfo(`new DslCss("abc", "", 0, "", "", 0, 0, ""...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("abc", "", 0, "", "", 0, 0, ""...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("abc", "", 0, "", "", 0, 0, ""...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("abc", "", 0, "", "", 0, 0, ""...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("abc", "", 0, "", "", 0, 0, ""...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("abc", "", 0, "", "", 0, 0, ""...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("abc", "", 0, "", "", 0, 0, ""...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("abc", "", 0, "", "", 0, 0, ""...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("abc", "", 0, "", "", 0, 0, ""...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0003 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0004
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0004
     * @tc.desc      new DslCss("Hello World", "", 0, "", "", 0, 0, "", -100, -100, -100, -100, "Hello") initialises ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0004 begin`);
      const subject: DslCss = new DslCss('Hello World', '', 0, '', '', 0, 0, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("Hello World", "", 0, "", "", ...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('Hello World');
      logInfo(`new DslCss("Hello World", "", 0, "", "", ...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("Hello World", "", 0, "", "", ...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("Hello World", "", 0, "", "", ...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("Hello World", "", 0, "", "", ...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("Hello World", "", 0, "", "", ...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("Hello World", "", 0, "", "", ...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("Hello World", "", 0, "", "", ...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("Hello World", "", 0, "", "", ...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("Hello World", "", 0, "", "", ...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0004 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0005
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0005
     * @tc.desc      new DslCss(" ", "", 0, "", "", 0, 0, "", -100, -100, -100, -100, "Hello") initialises 10 public ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0005 begin`);
      const subject: DslCss = new DslCss(' ', '', 0, '', '', 0, 0, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss(" ", "", 0, "", "", 0, 0, "", ...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual(' ');
      logInfo(`new DslCss(" ", "", 0, "", "", 0, 0, "", ...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss(" ", "", 0, "", "", 0, 0, "", ...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss(" ", "", 0, "", "", 0, 0, "", ...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss(" ", "", 0, "", "", 0, 0, "", ...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss(" ", "", 0, "", "", 0, 0, "", ...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss(" ", "", 0, "", "", 0, 0, "", ...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss(" ", "", 0, "", "", 0, 0, "", ...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss(" ", "", 0, "", "", 0, 0, "", ...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss(" ", "", 0, "", "", 0, 0, "", ...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0005 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0006
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0006
     * @tc.desc      new DslCss("123", "", 0, "", "", 0, 0, "", -100, -100, -100, -100, "Hello") initialises 10 publi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0006 begin`);
      const subject: DslCss = new DslCss('123', '', 0, '', '', 0, 0, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("123", "", 0, "", "", 0, 0, ""...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('123');
      logInfo(`new DslCss("123", "", 0, "", "", 0, 0, ""...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("123", "", 0, "", "", 0, 0, ""...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("123", "", 0, "", "", 0, 0, ""...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("123", "", 0, "", "", 0, 0, ""...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("123", "", 0, "", "", 0, 0, ""...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("123", "", 0, "", "", 0, 0, ""...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("123", "", 0, "", "", 0, 0, ""...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("123", "", 0, "", "", 0, 0, ""...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("123", "", 0, "", "", 0, 0, ""...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0006 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0007
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0007
     * @tc.desc      new DslCss(" a ", "", 0, "", "", 0, 0, "", -100, -100, -100, -100, "Hello") initialises 10 publi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0007 begin`);
      const subject: DslCss = new DslCss(' a ', '', 0, '', '', 0, 0, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss(" a ", "", 0, "", "", 0, 0, ""...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual(' a ');
      logInfo(`new DslCss(" a ", "", 0, "", "", 0, 0, ""...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss(" a ", "", 0, "", "", 0, 0, ""...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss(" a ", "", 0, "", "", 0, 0, ""...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss(" a ", "", 0, "", "", 0, 0, ""...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss(" a ", "", 0, "", "", 0, 0, ""...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss(" a ", "", 0, "", "", 0, 0, ""...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss(" a ", "", 0, "", "", 0, 0, ""...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss(" a ", "", 0, "", "", 0, 0, ""...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss(" a ", "", 0, "", "", 0, 0, ""...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0007 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0008
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0008
     * @tc.desc      new DslCss("aa", "", 0, "", "", 0, 0, "", -100, -100, -100, -100, "Hello") initialises 10 public...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0008 begin`);
      const subject: DslCss = new DslCss('aa', '', 0, '', '', 0, 0, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("aa", "", 0, "", "", 0, 0, "",...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('aa');
      logInfo(`new DslCss("aa", "", 0, "", "", 0, 0, "",...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("aa", "", 0, "", "", 0, 0, "",...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("aa", "", 0, "", "", 0, 0, "",...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("aa", "", 0, "", "", 0, 0, "",...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("aa", "", 0, "", "", 0, 0, "",...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("aa", "", 0, "", "", 0, 0, "",...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("aa", "", 0, "", "", 0, 0, "",...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("aa", "", 0, "", "", 0, 0, "",...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("aa", "", 0, "", "", 0, 0, "",...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0008 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0009
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0009
     * @tc.desc      new DslCss("a_1", "", 0, "", "", 0, 0, "", -100, -100, -100, -100, "Hello") initialises 10 publi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0009 begin`);
      const subject: DslCss = new DslCss('a_1', '', 0, '', '', 0, 0, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("a_1", "", 0, "", "", 0, 0, ""...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('a_1');
      logInfo(`new DslCss("a_1", "", 0, "", "", 0, 0, ""...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("a_1", "", 0, "", "", 0, 0, ""...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("a_1", "", 0, "", "", 0, 0, ""...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("a_1", "", 0, "", "", 0, 0, ""...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("a_1", "", 0, "", "", 0, 0, ""...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("a_1", "", 0, "", "", 0, 0, ""...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("a_1", "", 0, "", "", 0, 0, ""...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("a_1", "", 0, "", "", 0, 0, ""...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("a_1", "", 0, "", "", 0, 0, ""...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0009 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0010
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0010
     * @tc.desc      new DslCss("xa", "", 0, "", "", 0, 0, "", -100, -100, -100, -100, "Hello") initialises 10 public...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0010 begin`);
      const subject: DslCss = new DslCss('xa', '', 0, '', '', 0, 0, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("xa", "", 0, "", "", 0, 0, "",...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('xa');
      logInfo(`new DslCss("xa", "", 0, "", "", 0, 0, "",...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("xa", "", 0, "", "", 0, 0, "",...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("xa", "", 0, "", "", 0, 0, "",...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("xa", "", 0, "", "", 0, 0, "",...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("xa", "", 0, "", "", 0, 0, "",...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("xa", "", 0, "", "", 0, 0, "",...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("xa", "", 0, "", "", 0, 0, "",...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("xa", "", 0, "", "", 0, 0, "",...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("xa", "", 0, "", "", 0, 0, "",...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0010 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0011
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0011
     * @tc.desc      new DslCss(" abc ", "", 0, "", "", 0, 0, "", -100, -100, -100, -100, "Hello") initialises 10 pub...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0011 begin`);
      const subject: DslCss = new DslCss(' abc ', '', 0, '', '', 0, 0, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss(" abc ", "", 0, "", "", 0, 0, ...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual(' abc ');
      logInfo(`new DslCss(" abc ", "", 0, "", "", 0, 0, ...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss(" abc ", "", 0, "", "", 0, 0, ...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss(" abc ", "", 0, "", "", 0, 0, ...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss(" abc ", "", 0, "", "", 0, 0, ...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss(" abc ", "", 0, "", "", 0, 0, ...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss(" abc ", "", 0, "", "", 0, 0, ...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss(" abc ", "", 0, "", "", 0, 0, ...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss(" abc ", "", 0, "", "", 0, 0, ...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss(" abc ", "", 0, "", "", 0, 0, ...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0011 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0012
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0012
     * @tc.desc      new DslCss("abcabc", "", 0, "", "", 0, 0, "", -100, -100, -100, -100, "Hello") initialises 10 pu...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0012 begin`);
      const subject: DslCss = new DslCss('abcabc', '', 0, '', '', 0, 0, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("abcabc", "", 0, "", "", 0, 0,...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('abcabc');
      logInfo(`new DslCss("abcabc", "", 0, "", "", 0, 0,...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("abcabc", "", 0, "", "", 0, 0,...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("abcabc", "", 0, "", "", 0, 0,...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("abcabc", "", 0, "", "", 0, 0,...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("abcabc", "", 0, "", "", 0, 0,...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("abcabc", "", 0, "", "", 0, 0,...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("abcabc", "", 0, "", "", 0, 0,...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("abcabc", "", 0, "", "", 0, 0,...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("abcabc", "", 0, "", "", 0, 0,...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0012 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0013
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0013
     * @tc.desc      new DslCss("abc_1", "", 0, "", "", 0, 0, "", -100, -100, -100, -100, "Hello") initialises 10 pub...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0013 begin`);
      const subject: DslCss = new DslCss('abc_1', '', 0, '', '', 0, 0, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("abc_1", "", 0, "", "", 0, 0, ...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('abc_1');
      logInfo(`new DslCss("abc_1", "", 0, "", "", 0, 0, ...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("abc_1", "", 0, "", "", 0, 0, ...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("abc_1", "", 0, "", "", 0, 0, ...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("abc_1", "", 0, "", "", 0, 0, ...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("abc_1", "", 0, "", "", 0, 0, ...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("abc_1", "", 0, "", "", 0, 0, ...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("abc_1", "", 0, "", "", 0, 0, ...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("abc_1", "", 0, "", "", 0, 0, ...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("abc_1", "", 0, "", "", 0, 0, ...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0013 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0014
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0014
     * @tc.desc      new DslCss("xabc", "", 0, "", "", 0, 0, "", -100, -100, -100, -100, "Hello") initialises 10 publ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0014 begin`);
      const subject: DslCss = new DslCss('xabc', '', 0, '', '', 0, 0, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("xabc", "", 0, "", "", 0, 0, "...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('xabc');
      logInfo(`new DslCss("xabc", "", 0, "", "", 0, 0, "...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("xabc", "", 0, "", "", 0, 0, "...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("xabc", "", 0, "", "", 0, 0, "...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("xabc", "", 0, "", "", 0, 0, "...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("xabc", "", 0, "", "", 0, 0, "...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("xabc", "", 0, "", "", 0, 0, "...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("xabc", "", 0, "", "", 0, 0, "...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("xabc", "", 0, "", "", 0, 0, "...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("xabc", "", 0, "", "", 0, 0, "...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0014 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0015
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0015
     * @tc.desc      new DslCss("", "a", 0, "", "", 0, 0, "", -100, -100, -100, -100, "Hello") initialises 10 public ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0015 begin`);
      const subject: DslCss = new DslCss('', 'a', 0, '', '', 0, 0, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "a", 0, "", "", 0, 0, "", ...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "a", 0, "", "", 0, 0, "", ...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('a');
      logInfo(`new DslCss("", "a", 0, "", "", 0, 0, "", ...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "a", 0, "", "", 0, 0, "", ...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "a", 0, "", "", 0, 0, "", ...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "a", 0, "", "", 0, 0, "", ...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "a", 0, "", "", 0, 0, "", ...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "a", 0, "", "", 0, 0, "", ...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "a", 0, "", "", 0, 0, "", ...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "a", 0, "", "", 0, 0, "", ...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0015 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0016
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0016
     * @tc.desc      new DslCss("", "abc", 0, "", "", 0, 0, "", -100, -100, -100, -100, "Hello") initialises 10 publi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0016 begin`);
      const subject: DslCss = new DslCss('', 'abc', 0, '', '', 0, 0, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "abc", 0, "", "", 0, 0, ""...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "abc", 0, "", "", 0, 0, ""...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('abc');
      logInfo(`new DslCss("", "abc", 0, "", "", 0, 0, ""...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "abc", 0, "", "", 0, 0, ""...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "abc", 0, "", "", 0, 0, ""...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "abc", 0, "", "", 0, 0, ""...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "abc", 0, "", "", 0, 0, ""...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "abc", 0, "", "", 0, 0, ""...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "abc", 0, "", "", 0, 0, ""...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "abc", 0, "", "", 0, 0, ""...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0016 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0017
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0017
     * @tc.desc      new DslCss("", "Hello World", 0, "", "", 0, 0, "", -100, -100, -100, -100, "Hello") initialises ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0017 begin`);
      const subject: DslCss = new DslCss('', 'Hello World', 0, '', '', 0, 0, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "Hello World", 0, "", "", ...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "Hello World", 0, "", "", ...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('Hello World');
      logInfo(`new DslCss("", "Hello World", 0, "", "", ...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "Hello World", 0, "", "", ...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "Hello World", 0, "", "", ...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "Hello World", 0, "", "", ...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "Hello World", 0, "", "", ...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "Hello World", 0, "", "", ...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "Hello World", 0, "", "", ...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "Hello World", 0, "", "", ...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0017 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0018
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0018
     * @tc.desc      new DslCss("", " ", 0, "", "", 0, 0, "", -100, -100, -100, -100, "Hello") initialises 10 public ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0018 begin`);
      const subject: DslCss = new DslCss('', ' ', 0, '', '', 0, 0, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", " ", 0, "", "", 0, 0, "", ...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", " ", 0, "", "", 0, 0, "", ...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual(' ');
      logInfo(`new DslCss("", " ", 0, "", "", 0, 0, "", ...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", " ", 0, "", "", 0, 0, "", ...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", " ", 0, "", "", 0, 0, "", ...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", " ", 0, "", "", 0, 0, "", ...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", " ", 0, "", "", 0, 0, "", ...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", " ", 0, "", "", 0, 0, "", ...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", " ", 0, "", "", 0, 0, "", ...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", " ", 0, "", "", 0, 0, "", ...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0018 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0019
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0019
     * @tc.desc      new DslCss("", "123", 0, "", "", 0, 0, "", -100, -100, -100, -100, "Hello") initialises 10 publi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0019 begin`);
      const subject: DslCss = new DslCss('', '123', 0, '', '', 0, 0, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "123", 0, "", "", 0, 0, ""...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "123", 0, "", "", 0, 0, ""...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('123');
      logInfo(`new DslCss("", "123", 0, "", "", 0, 0, ""...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "123", 0, "", "", 0, 0, ""...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "123", 0, "", "", 0, 0, ""...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "123", 0, "", "", 0, 0, ""...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "123", 0, "", "", 0, 0, ""...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "123", 0, "", "", 0, 0, ""...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "123", 0, "", "", 0, 0, ""...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "123", 0, "", "", 0, 0, ""...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0019 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0020
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0020
     * @tc.desc      new DslCss("", " a ", 0, "", "", 0, 0, "", -100, -100, -100, -100, "Hello") initialises 10 publi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0020 begin`);
      const subject: DslCss = new DslCss('', ' a ', 0, '', '', 0, 0, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", " a ", 0, "", "", 0, 0, ""...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", " a ", 0, "", "", 0, 0, ""...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual(' a ');
      logInfo(`new DslCss("", " a ", 0, "", "", 0, 0, ""...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", " a ", 0, "", "", 0, 0, ""...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", " a ", 0, "", "", 0, 0, ""...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", " a ", 0, "", "", 0, 0, ""...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", " a ", 0, "", "", 0, 0, ""...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", " a ", 0, "", "", 0, 0, ""...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", " a ", 0, "", "", 0, 0, ""...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", " a ", 0, "", "", 0, 0, ""...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0020 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0021
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0021
     * @tc.desc      new DslCss("", "aa", 0, "", "", 0, 0, "", -100, -100, -100, -100, "Hello") initialises 10 public...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0021 begin`);
      const subject: DslCss = new DslCss('', 'aa', 0, '', '', 0, 0, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "aa", 0, "", "", 0, 0, "",...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "aa", 0, "", "", 0, 0, "",...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('aa');
      logInfo(`new DslCss("", "aa", 0, "", "", 0, 0, "",...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "aa", 0, "", "", 0, 0, "",...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "aa", 0, "", "", 0, 0, "",...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "aa", 0, "", "", 0, 0, "",...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "aa", 0, "", "", 0, 0, "",...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "aa", 0, "", "", 0, 0, "",...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "aa", 0, "", "", 0, 0, "",...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "aa", 0, "", "", 0, 0, "",...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0021 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0022
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0022
     * @tc.desc      new DslCss("", "a_1", 0, "", "", 0, 0, "", -100, -100, -100, -100, "Hello") initialises 10 publi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0022 begin`);
      const subject: DslCss = new DslCss('', 'a_1', 0, '', '', 0, 0, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "a_1", 0, "", "", 0, 0, ""...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "a_1", 0, "", "", 0, 0, ""...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('a_1');
      logInfo(`new DslCss("", "a_1", 0, "", "", 0, 0, ""...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "a_1", 0, "", "", 0, 0, ""...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "a_1", 0, "", "", 0, 0, ""...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "a_1", 0, "", "", 0, 0, ""...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "a_1", 0, "", "", 0, 0, ""...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "a_1", 0, "", "", 0, 0, ""...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "a_1", 0, "", "", 0, 0, ""...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "a_1", 0, "", "", 0, 0, ""...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0022 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0023
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0023
     * @tc.desc      new DslCss("", "xa", 0, "", "", 0, 0, "", -100, -100, -100, -100, "Hello") initialises 10 public...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0023 begin`);
      const subject: DslCss = new DslCss('', 'xa', 0, '', '', 0, 0, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "xa", 0, "", "", 0, 0, "",...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "xa", 0, "", "", 0, 0, "",...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('xa');
      logInfo(`new DslCss("", "xa", 0, "", "", 0, 0, "",...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "xa", 0, "", "", 0, 0, "",...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "xa", 0, "", "", 0, 0, "",...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "xa", 0, "", "", 0, 0, "",...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "xa", 0, "", "", 0, 0, "",...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "xa", 0, "", "", 0, 0, "",...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "xa", 0, "", "", 0, 0, "",...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "xa", 0, "", "", 0, 0, "",...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0023 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0024
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0024
     * @tc.desc      new DslCss("", " abc ", 0, "", "", 0, 0, "", -100, -100, -100, -100, "Hello") initialises 10 pub...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0024 begin`);
      const subject: DslCss = new DslCss('', ' abc ', 0, '', '', 0, 0, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", " abc ", 0, "", "", 0, 0, ...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", " abc ", 0, "", "", 0, 0, ...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual(' abc ');
      logInfo(`new DslCss("", " abc ", 0, "", "", 0, 0, ...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", " abc ", 0, "", "", 0, 0, ...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", " abc ", 0, "", "", 0, 0, ...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", " abc ", 0, "", "", 0, 0, ...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", " abc ", 0, "", "", 0, 0, ...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", " abc ", 0, "", "", 0, 0, ...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", " abc ", 0, "", "", 0, 0, ...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", " abc ", 0, "", "", 0, 0, ...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0024 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0025
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0025
     * @tc.desc      new DslCss("", "abcabc", 0, "", "", 0, 0, "", -100, -100, -100, -100, "Hello") initialises 10 pu...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0025 begin`);
      const subject: DslCss = new DslCss('', 'abcabc', 0, '', '', 0, 0, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "abcabc", 0, "", "", 0, 0,...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "abcabc", 0, "", "", 0, 0,...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('abcabc');
      logInfo(`new DslCss("", "abcabc", 0, "", "", 0, 0,...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "abcabc", 0, "", "", 0, 0,...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "abcabc", 0, "", "", 0, 0,...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "abcabc", 0, "", "", 0, 0,...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "abcabc", 0, "", "", 0, 0,...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "abcabc", 0, "", "", 0, 0,...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "abcabc", 0, "", "", 0, 0,...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "abcabc", 0, "", "", 0, 0,...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0025 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0026
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0026
     * @tc.desc      new DslCss("", "abc_1", 0, "", "", 0, 0, "", -100, -100, -100, -100, "Hello") initialises 10 pub...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0026 begin`);
      const subject: DslCss = new DslCss('', 'abc_1', 0, '', '', 0, 0, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "abc_1", 0, "", "", 0, 0, ...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "abc_1", 0, "", "", 0, 0, ...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('abc_1');
      logInfo(`new DslCss("", "abc_1", 0, "", "", 0, 0, ...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "abc_1", 0, "", "", 0, 0, ...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "abc_1", 0, "", "", 0, 0, ...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "abc_1", 0, "", "", 0, 0, ...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "abc_1", 0, "", "", 0, 0, ...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "abc_1", 0, "", "", 0, 0, ...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "abc_1", 0, "", "", 0, 0, ...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "abc_1", 0, "", "", 0, 0, ...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0026 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0027
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0027
     * @tc.desc      new DslCss("", "xabc", 0, "", "", 0, 0, "", -100, -100, -100, -100, "Hello") initialises 10 publ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0027 begin`);
      const subject: DslCss = new DslCss('', 'xabc', 0, '', '', 0, 0, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "xabc", 0, "", "", 0, 0, "...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "xabc", 0, "", "", 0, 0, "...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('xabc');
      logInfo(`new DslCss("", "xabc", 0, "", "", 0, 0, "...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "xabc", 0, "", "", 0, 0, "...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "xabc", 0, "", "", 0, 0, "...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "xabc", 0, "", "", 0, 0, "...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "xabc", 0, "", "", 0, 0, "...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "xabc", 0, "", "", 0, 0, "...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "xabc", 0, "", "", 0, 0, "...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "xabc", 0, "", "", 0, 0, "...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0027 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0028
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0028
     * @tc.desc      new DslCss("", "", 1, "", "", 0, 0, "", -100, -100, -100, -100, "Hello") initialises 10 public m...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0028 begin`);
      const subject: DslCss = new DslCss('', '', 1, '', '', 0, 0, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 1, "", "", 0, 0, "", -...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 1, "", "", 0, 0, "", -...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 1, "", "", 0, 0, "", -...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(1);
      logInfo(`new DslCss("", "", 1, "", "", 0, 0, "", -...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "", 1, "", "", 0, 0, "", -...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "", 1, "", "", 0, 0, "", -...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "", 1, "", "", 0, 0, "", -...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "", 1, "", "", 0, 0, "", -...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "", 1, "", "", 0, 0, "", -...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "", 1, "", "", 0, 0, "", -...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0028 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0029
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0029
     * @tc.desc      new DslCss("", "", 2, "", "", 0, 0, "", -100, -100, -100, -100, "Hello") initialises 10 public m...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0029 begin`);
      const subject: DslCss = new DslCss('', '', 2, '', '', 0, 0, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 2, "", "", 0, 0, "", -...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 2, "", "", 0, 0, "", -...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 2, "", "", 0, 0, "", -...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(2);
      logInfo(`new DslCss("", "", 2, "", "", 0, 0, "", -...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "", 2, "", "", 0, 0, "", -...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "", 2, "", "", 0, 0, "", -...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "", 2, "", "", 0, 0, "", -...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "", 2, "", "", 0, 0, "", -...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "", 2, "", "", 0, 0, "", -...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "", 2, "", "", 0, 0, "", -...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0029 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0030
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0030
     * @tc.desc      new DslCss("", "", 5, "", "", 0, 0, "", -100, -100, -100, -100, "Hello") initialises 10 public m...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0030 begin`);
      const subject: DslCss = new DslCss('', '', 5, '', '', 0, 0, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 5, "", "", 0, 0, "", -...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 5, "", "", 0, 0, "", -...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 5, "", "", 0, 0, "", -...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(5);
      logInfo(`new DslCss("", "", 5, "", "", 0, 0, "", -...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "", 5, "", "", 0, 0, "", -...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "", 5, "", "", 0, 0, "", -...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "", 5, "", "", 0, 0, "", -...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "", 5, "", "", 0, 0, "", -...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "", 5, "", "", 0, 0, "", -...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "", 5, "", "", 0, 0, "", -...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0030 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0031
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0031
     * @tc.desc      new DslCss("", "", 10, "", "", 0, 0, "", -100, -100, -100, -100, "Hello") initialises 10 public ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0031 begin`);
      const subject: DslCss = new DslCss('', '', 10, '', '', 0, 0, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 10, "", "", 0, 0, "", ...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 10, "", "", 0, 0, "", ...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 10, "", "", 0, 0, "", ...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(10);
      logInfo(`new DslCss("", "", 10, "", "", 0, 0, "", ...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "", 10, "", "", 0, 0, "", ...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "", 10, "", "", 0, 0, "", ...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "", 10, "", "", 0, 0, "", ...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "", 10, "", "", 0, 0, "", ...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "", 10, "", "", 0, 0, "", ...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "", 10, "", "", 0, 0, "", ...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0031 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0032
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0032
     * @tc.desc      new DslCss("", "", 100, "", "", 0, 0, "", -100, -100, -100, -100, "Hello") initialises 10 public...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0032 begin`);
      const subject: DslCss = new DslCss('', '', 100, '', '', 0, 0, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 100, "", "", 0, 0, "",...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 100, "", "", 0, 0, "",...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 100, "", "", 0, 0, "",...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(100);
      logInfo(`new DslCss("", "", 100, "", "", 0, 0, "",...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "", 100, "", "", 0, 0, "",...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "", 100, "", "", 0, 0, "",...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "", 100, "", "", 0, 0, "",...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "", 100, "", "", 0, 0, "",...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "", 100, "", "", 0, 0, "",...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "", 100, "", "", 0, 0, "",...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0032 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0033
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0033
     * @tc.desc      new DslCss("", "", -1, "", "", 0, 0, "", -100, -100, -100, -100, "Hello") initialises 10 public ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0033 begin`);
      const subject: DslCss = new DslCss('', '', -1, '', '', 0, 0, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", -1, "", "", 0, 0, "", ...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", -1, "", "", 0, 0, "", ...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", -1, "", "", 0, 0, "", ...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(-1);
      logInfo(`new DslCss("", "", -1, "", "", 0, 0, "", ...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "", -1, "", "", 0, 0, "", ...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "", -1, "", "", 0, 0, "", ...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "", -1, "", "", 0, 0, "", ...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "", -1, "", "", 0, 0, "", ...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "", -1, "", "", 0, 0, "", ...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "", -1, "", "", 0, 0, "", ...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0033 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0034
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0034
     * @tc.desc      new DslCss("", "", 3, "", "", 0, 0, "", -100, -100, -100, -100, "Hello") initialises 10 public m...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0034 begin`);
      const subject: DslCss = new DslCss('', '', 3, '', '', 0, 0, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 3, "", "", 0, 0, "", -...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 3, "", "", 0, 0, "", -...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 3, "", "", 0, 0, "", -...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(3);
      logInfo(`new DslCss("", "", 3, "", "", 0, 0, "", -...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "", 3, "", "", 0, 0, "", -...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "", 3, "", "", 0, 0, "", -...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "", 3, "", "", 0, 0, "", -...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "", 3, "", "", 0, 0, "", -...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "", 3, "", "", 0, 0, "", -...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "", 3, "", "", 0, 0, "", -...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0034 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0035
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0035
     * @tc.desc      new DslCss("", "", 15, "", "", 0, 0, "", -100, -100, -100, -100, "Hello") initialises 10 public ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0035 begin`);
      const subject: DslCss = new DslCss('', '', 15, '', '', 0, 0, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 15, "", "", 0, 0, "", ...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 15, "", "", 0, 0, "", ...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 15, "", "", 0, 0, "", ...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(15);
      logInfo(`new DslCss("", "", 15, "", "", 0, 0, "", ...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "", 15, "", "", 0, 0, "", ...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "", 15, "", "", 0, 0, "", ...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "", 15, "", "", 0, 0, "", ...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "", 15, "", "", 0, 0, "", ...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "", 15, "", "", 0, 0, "", ...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "", 15, "", "", 0, 0, "", ...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0035 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0036
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0036
     * @tc.desc      new DslCss("", "", 20, "", "", 0, 0, "", -100, -100, -100, -100, "Hello") initialises 10 public ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0036 begin`);
      const subject: DslCss = new DslCss('', '', 20, '', '', 0, 0, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 20, "", "", 0, 0, "", ...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 20, "", "", 0, 0, "", ...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 20, "", "", 0, 0, "", ...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(20);
      logInfo(`new DslCss("", "", 20, "", "", 0, 0, "", ...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "", 20, "", "", 0, 0, "", ...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "", 20, "", "", 0, 0, "", ...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "", 20, "", "", 0, 0, "", ...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "", 20, "", "", 0, 0, "", ...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "", 20, "", "", 0, 0, "", ...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "", 20, "", "", 0, 0, "", ...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0036 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0037
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0037
     * @tc.desc      new DslCss("", "", 25, "", "", 0, 0, "", -100, -100, -100, -100, "Hello") initialises 10 public ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0037 begin`);
      const subject: DslCss = new DslCss('', '', 25, '', '', 0, 0, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 25, "", "", 0, 0, "", ...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 25, "", "", 0, 0, "", ...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 25, "", "", 0, 0, "", ...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(25);
      logInfo(`new DslCss("", "", 25, "", "", 0, 0, "", ...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "", 25, "", "", 0, 0, "", ...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "", 25, "", "", 0, 0, "", ...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "", 25, "", "", 0, 0, "", ...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "", 25, "", "", 0, 0, "", ...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "", 25, "", "", 0, 0, "", ...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "", 25, "", "", 0, 0, "", ...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0037 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0038
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0038
     * @tc.desc      new DslCss("", "", 30, "", "", 0, 0, "", -100, -100, -100, -100, "Hello") initialises 10 public ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0038 begin`);
      const subject: DslCss = new DslCss('', '', 30, '', '', 0, 0, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 30, "", "", 0, 0, "", ...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 30, "", "", 0, 0, "", ...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 30, "", "", 0, 0, "", ...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(30);
      logInfo(`new DslCss("", "", 30, "", "", 0, 0, "", ...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "", 30, "", "", 0, 0, "", ...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "", 30, "", "", 0, 0, "", ...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "", 30, "", "", 0, 0, "", ...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "", 30, "", "", 0, 0, "", ...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "", 30, "", "", 0, 0, "", ...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "", 30, "", "", 0, 0, "", ...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0038 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0039
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0039
     * @tc.desc      new DslCss("", "", 35, "", "", 0, 0, "", -100, -100, -100, -100, "Hello") initialises 10 public ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0039 begin`);
      const subject: DslCss = new DslCss('', '', 35, '', '', 0, 0, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 35, "", "", 0, 0, "", ...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 35, "", "", 0, 0, "", ...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 35, "", "", 0, 0, "", ...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(35);
      logInfo(`new DslCss("", "", 35, "", "", 0, 0, "", ...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "", 35, "", "", 0, 0, "", ...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "", 35, "", "", 0, 0, "", ...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "", 35, "", "", 0, 0, "", ...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "", 35, "", "", 0, 0, "", ...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "", 35, "", "", 0, 0, "", ...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "", 35, "", "", 0, 0, "", ...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0039 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0040
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0040
     * @tc.desc      new DslCss("", "", 40, "", "", 0, 0, "", -100, -100, -100, -100, "Hello") initialises 10 public ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0040 begin`);
      const subject: DslCss = new DslCss('', '', 40, '', '', 0, 0, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 40, "", "", 0, 0, "", ...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 40, "", "", 0, 0, "", ...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 40, "", "", 0, 0, "", ...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(40);
      logInfo(`new DslCss("", "", 40, "", "", 0, 0, "", ...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "", 40, "", "", 0, 0, "", ...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "", 40, "", "", 0, 0, "", ...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "", 40, "", "", 0, 0, "", ...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "", 40, "", "", 0, 0, "", ...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "", 40, "", "", 0, 0, "", ...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "", 40, "", "", 0, 0, "", ...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0040 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0041
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0041
     * @tc.desc      new DslCss("", "", -73, "", "", 0, 0, "", -100, -100, -100, -100, "Hello") initialises 10 public...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0041 begin`);
      const subject: DslCss = new DslCss('', '', -73, '', '', 0, 0, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", -73, "", "", 0, 0, "",...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", -73, "", "", 0, 0, "",...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", -73, "", "", 0, 0, "",...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(-73);
      logInfo(`new DslCss("", "", -73, "", "", 0, 0, "",...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "", -73, "", "", 0, 0, "",...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "", -73, "", "", 0, 0, "",...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "", -73, "", "", 0, 0, "",...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "", -73, "", "", 0, 0, "",...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "", -73, "", "", 0, 0, "",...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "", -73, "", "", 0, 0, "",...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0041 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0042
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0042
     * @tc.desc      new DslCss("", "", 51, "", "", 0, 0, "", -100, -100, -100, -100, "Hello") initialises 10 public ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0042 begin`);
      const subject: DslCss = new DslCss('', '', 51, '', '', 0, 0, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 51, "", "", 0, 0, "", ...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 51, "", "", 0, 0, "", ...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 51, "", "", 0, 0, "", ...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(51);
      logInfo(`new DslCss("", "", 51, "", "", 0, 0, "", ...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "", 51, "", "", 0, 0, "", ...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "", 51, "", "", 0, 0, "", ...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "", 51, "", "", 0, 0, "", ...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "", 51, "", "", 0, 0, "", ...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "", 51, "", "", 0, 0, "", ...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "", 51, "", "", 0, 0, "", ...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0042 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0043
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0043
     * @tc.desc      new DslCss("", "", 0, "a", "", 0, 0, "", -100, -100, -100, -100, "Hello") initialises 10 public ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0043 begin`);
      const subject: DslCss = new DslCss('', '', 0, 'a', '', 0, 0, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 0, "a", "", 0, 0, "", ...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 0, "a", "", 0, 0, "", ...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 0, "a", "", 0, 0, "", ...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "a", "", 0, 0, "", ...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('a');
      logInfo(`new DslCss("", "", 0, "a", "", 0, 0, "", ...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "a", "", 0, 0, "", ...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "a", "", 0, 0, "", ...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "a", "", 0, 0, "", ...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "", 0, "a", "", 0, 0, "", ...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "", 0, "a", "", 0, 0, "", ...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0043 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0044
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0044
     * @tc.desc      new DslCss("", "", 0, "abc", "", 0, 0, "", -100, -100, -100, -100, "Hello") initialises 10 publi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0044 begin`);
      const subject: DslCss = new DslCss('', '', 0, 'abc', '', 0, 0, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 0, "abc", "", 0, 0, ""...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 0, "abc", "", 0, 0, ""...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 0, "abc", "", 0, 0, ""...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "abc", "", 0, 0, ""...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('abc');
      logInfo(`new DslCss("", "", 0, "abc", "", 0, 0, ""...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "abc", "", 0, 0, ""...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "abc", "", 0, 0, ""...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "abc", "", 0, 0, ""...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "", 0, "abc", "", 0, 0, ""...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "", 0, "abc", "", 0, 0, ""...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0044 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0045
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0045
     * @tc.desc      new DslCss("", "", 0, "Hello World", "", 0, 0, "", -100, -100, -100, -100, "Hello") initialises ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0045 begin`);
      const subject: DslCss = new DslCss('', '', 0, 'Hello World', '', 0, 0, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 0, "Hello World", "", ...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 0, "Hello World", "", ...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 0, "Hello World", "", ...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "Hello World", "", ...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('Hello World');
      logInfo(`new DslCss("", "", 0, "Hello World", "", ...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "Hello World", "", ...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "Hello World", "", ...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "Hello World", "", ...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "", 0, "Hello World", "", ...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "", 0, "Hello World", "", ...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0045 end`);
    });
  });
}
