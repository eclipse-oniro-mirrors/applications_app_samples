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
export default function dslCssCtor3Test(): void {
  describe('DslCssCtor3Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0091
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0091
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 10, "", -100, -100, -100, -100, "Hello") initialises 10 public ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0091 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 10, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 0, "", "", 0, 10, "", ...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 10, "", ...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 10, "", ...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 10, "", ...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 10, "", ...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 10, "", ...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 10, "", ...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(10);
      logInfo(`new DslCss("", "", 0, "", "", 0, 10, "", ...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 10, "", ...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "", 0, "", "", 0, 10, "", ...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0091 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0092
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0092
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 100, "", -100, -100, -100, -100, "Hello") initialises 10 public...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0092 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 100, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 0, "", "", 0, 100, "",...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 100, "",...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 100, "",...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 100, "",...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 100, "",...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 100, "",...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 100, "",...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(100);
      logInfo(`new DslCss("", "", 0, "", "", 0, 100, "",...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 100, "",...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "", 0, "", "", 0, 100, "",...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0092 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0093
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0093
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 5, "", -100, -100, -100, -100, "Hello") initialises 10 public m...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0093 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 5, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 0, "", "", 0, 5, "", -...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 5, "", -...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 5, "", -...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 5, "", -...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 5, "", -...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 5, "", -...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 5, "", -...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(5);
      logInfo(`new DslCss("", "", 0, "", "", 0, 5, "", -...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 5, "", -...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "", 0, "", "", 0, 5, "", -...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0093 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0094
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0094
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 15, "", -100, -100, -100, -100, "Hello") initialises 10 public ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0094 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 15, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 0, "", "", 0, 15, "", ...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 15, "", ...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 15, "", ...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 15, "", ...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 15, "", ...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 15, "", ...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 15, "", ...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(15);
      logInfo(`new DslCss("", "", 0, "", "", 0, 15, "", ...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 15, "", ...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "", 0, "", "", 0, 15, "", ...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0094 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0095
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0095
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 20, "", -100, -100, -100, -100, "Hello") initialises 10 public ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0095 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 20, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 0, "", "", 0, 20, "", ...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 20, "", ...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 20, "", ...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 20, "", ...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 20, "", ...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 20, "", ...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 20, "", ...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(20);
      logInfo(`new DslCss("", "", 0, "", "", 0, 20, "", ...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 20, "", ...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "", 0, "", "", 0, 20, "", ...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0095 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0096
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0096
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 25, "", -100, -100, -100, -100, "Hello") initialises 10 public ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0096 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 25, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 0, "", "", 0, 25, "", ...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 25, "", ...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 25, "", ...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 25, "", ...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 25, "", ...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 25, "", ...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 25, "", ...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(25);
      logInfo(`new DslCss("", "", 0, "", "", 0, 25, "", ...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 25, "", ...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "", 0, "", "", 0, 25, "", ...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0096 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0097
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0097
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 30, "", -100, -100, -100, -100, "Hello") initialises 10 public ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0097 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 30, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 0, "", "", 0, 30, "", ...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 30, "", ...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 30, "", ...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 30, "", ...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 30, "", ...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 30, "", ...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 30, "", ...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(30);
      logInfo(`new DslCss("", "", 0, "", "", 0, 30, "", ...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 30, "", ...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "", 0, "", "", 0, 30, "", ...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0097 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0098
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0098
     * @tc.desc      new DslCss("", "", 0, "", "", 0, -13, "", -100, -100, -100, -100, "Hello") initialises 10 public...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0098 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, -13, '', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 0, "", "", 0, -13, "",...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, -13, "",...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, -13, "",...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, -13, "",...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, -13, "",...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, -13, "",...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, -13, "",...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(-13);
      logInfo(`new DslCss("", "", 0, "", "", 0, -13, "",...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, -13, "",...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "", 0, "", "", 0, -13, "",...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0098 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0099
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0099
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 0, "a", -100, -100, -100, -100, "Hello") initialises 10 public ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0099 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 0, 'a', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "a", ...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "a", ...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "a", ...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "a", ...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "a", ...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "a", ...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "a", ...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "a", ...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('a');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "a", ...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "a", ...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0099 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0100
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0100
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 0, "abc", -100, -100, -100, -100, "Hello") initialises 10 publi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0100 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 0, 'abc', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "abc"...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "abc"...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "abc"...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "abc"...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "abc"...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "abc"...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "abc"...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "abc"...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('abc');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "abc"...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "abc"...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0100 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0101
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0101
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 0, "Hello World", -100, -100, -100, -100, "Hello") initialises ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0101 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 0, 'Hello World', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "Hell...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "Hell...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "Hell...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "Hell...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "Hell...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "Hell...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "Hell...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "Hell...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('Hello World');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "Hell...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "Hell...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0101 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0102
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0102
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 0, " ", -100, -100, -100, -100, "Hello") initialises 10 public ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0102 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 0, ' ', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, " ", ...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, " ", ...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, " ", ...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, " ", ...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, " ", ...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, " ", ...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, " ", ...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, " ", ...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual(' ');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, " ", ...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, " ", ...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0102 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0103
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0103
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 0, "123", -100, -100, -100, -100, "Hello") initialises 10 publi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0103 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 0, '123', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "123"...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "123"...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "123"...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "123"...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "123"...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "123"...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "123"...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "123"...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('123');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "123"...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "123"...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0103 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0104
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0104
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 0, " a ", -100, -100, -100, -100, "Hello") initialises 10 publi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0104 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 0, ' a ', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, " a "...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, " a "...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, " a "...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, " a "...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, " a "...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, " a "...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, " a "...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, " a "...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual(' a ');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, " a "...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, " a "...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0104 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0105
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0105
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 0, "aa", -100, -100, -100, -100, "Hello") initialises 10 public...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0105 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 0, 'aa', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "aa",...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "aa",...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "aa",...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "aa",...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "aa",...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "aa",...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "aa",...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "aa",...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('aa');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "aa",...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "aa",...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0105 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0106
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0106
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 0, "a_1", -100, -100, -100, -100, "Hello") initialises 10 publi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0106 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 0, 'a_1', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "a_1"...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "a_1"...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "a_1"...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "a_1"...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "a_1"...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "a_1"...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "a_1"...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "a_1"...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('a_1');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "a_1"...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "a_1"...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0106 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0107
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0107
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 0, "xa", -100, -100, -100, -100, "Hello") initialises 10 public...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0107 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 0, 'xa', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "xa",...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "xa",...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "xa",...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "xa",...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "xa",...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "xa",...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "xa",...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "xa",...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('xa');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "xa",...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "xa",...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0107 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0108
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0108
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 0, " abc ", -100, -100, -100, -100, "Hello") initialises 10 pub...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0108 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 0, ' abc ', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, " abc...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, " abc...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, " abc...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, " abc...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, " abc...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, " abc...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, " abc...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, " abc...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual(' abc ');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, " abc...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, " abc...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0108 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0109
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0109
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 0, "abcabc", -100, -100, -100, -100, "Hello") initialises 10 pu...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0109 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 0, 'abcabc', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "abca...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "abca...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "abca...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "abca...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "abca...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "abca...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "abca...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "abca...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('abcabc');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "abca...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "abca...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0109 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0110
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0110
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 0, "abc_1", -100, -100, -100, -100, "Hello") initialises 10 pub...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0110 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 0, 'abc_1', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "abc_...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "abc_...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "abc_...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "abc_...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "abc_...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "abc_...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "abc_...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "abc_...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('abc_1');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "abc_...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "abc_...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0110 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0111
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0111
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 0, "xabc", -100, -100, -100, -100, "Hello") initialises 10 publ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0111 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 0, 'xabc', -100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "xabc...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "xabc...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "xabc...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "xabc...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "xabc...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "xabc...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "xabc...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "xabc...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('xabc');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "xabc...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(-100);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "xabc...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0111 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0112
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0112
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 0, "", -1, -100, -100, -100, "Hello") initialises 10 public mem...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0112 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 0, '', -1, -100, -100, -100, 'Hello');
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
      expect(subject.paddingLeft).assertEqual(-1);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", -...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0112 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0113
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0113
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 0, "", 0, -100, -100, -100, "Hello") initialises 10 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0113 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 0, '', 0, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 0...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 0...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 0...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 0...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 0...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 0...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 0...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 0...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 0...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 0...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0113 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0114
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0114
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 0, "", 1, -100, -100, -100, "Hello") initialises 10 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0114 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 0, '', 1, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 1...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 1...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 1...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 1...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 1...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 1...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 1...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 1...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 1...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(1);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 1...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0114 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0115
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0115
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 0, "", 50, -100, -100, -100, "Hello") initialises 10 public mem...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0115 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 0, '', 50, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 5...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 5...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 5...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 5...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 5...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 5...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 5...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 5...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 5...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(50);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 5...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0115 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0116
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0116
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 0, "", 100, -100, -100, -100, "Hello") initialises 10 public me...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0116 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 0, '', 100, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 1...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 1...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 1...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 1...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 1...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 1...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 1...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 1...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 1...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(100);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 1...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0116 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0117
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0117
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 0, "", 2, -100, -100, -100, "Hello") initialises 10 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0117 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 0, '', 2, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 2...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 2...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 2...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 2...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 2...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 2...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 2...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 2...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 2...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(2);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 2...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0117 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0118
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0118
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 0, "", 3, -100, -100, -100, "Hello") initialises 10 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0118 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 0, '', 3, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 3...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 3...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 3...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 3...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 3...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 3...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 3...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 3...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 3...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(3);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 3...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0118 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0119
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0119
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 0, "", 10, -100, -100, -100, "Hello") initialises 10 public mem...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0119 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 0, '', 10, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 1...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 1...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 1...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 1...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 1...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 1...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 1...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 1...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 1...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(10);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 1...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0119 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0120
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0120
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 0, "", 5, -100, -100, -100, "Hello") initialises 10 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0120 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 0, '', 5, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 5...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 5...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 5...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 5...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 5...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 5...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 5...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 5...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 5...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(5);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 5...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0120 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0121
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0121
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 0, "", 15, -100, -100, -100, "Hello") initialises 10 public mem...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0121 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 0, '', 15, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 1...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 1...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 1...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 1...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 1...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 1...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 1...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 1...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 1...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(15);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 1...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0121 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0122
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0122
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 0, "", 20, -100, -100, -100, "Hello") initialises 10 public mem...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0122 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 0, '', 20, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 2...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 2...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 2...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 2...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 2...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 2...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 2...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 2...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 2...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(20);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 2...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0122 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0123
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0123
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 0, "", 25, -100, -100, -100, "Hello") initialises 10 public mem...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0123 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 0, '', 25, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 2...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 2...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 2...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 2...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 2...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 2...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 2...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 2...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 2...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(25);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 2...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0123 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0124
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0124
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 0, "", 30, -100, -100, -100, "Hello") initialises 10 public mem...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0124 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 0, '', 30, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 3...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 3...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 3...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 3...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 3...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 3...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 3...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 3...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 3...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(30);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 3...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0124 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0125
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0125
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 0, "", 35, -100, -100, -100, "Hello") initialises 10 public mem...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0125 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 0, '', 35, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 3...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 3...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 3...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 3...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 3...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 3...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 3...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 3...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 3...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(35);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 3...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0125 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0126
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0126
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 0, "", 85, -100, -100, -100, "Hello") initialises 10 public mem...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0126 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 0, '', 85, -100, -100, -100, 'Hello');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 8...: subject.width=${subject.width}`);
      expect(subject.width).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 8...: subject.height=${subject.height}`);
      expect(subject.height).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 8...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 8...: subject.fontColor=${subject.fontColor}`);
      expect(subject.fontColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 8...: subject.backgroundColor=${subject.backgroundColor}`);
      expect(subject.backgroundColor).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 8...: subject.borderRadius=${subject.borderRadius}`);
      expect(subject.borderRadius).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 8...: subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(0);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 8...: subject.alignItems=${subject.alignItems}`);
      expect(subject.alignItems).assertEqual('');
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 8...: subject.paddingLeft=${subject.paddingLeft}`);
      expect(subject.paddingLeft).assertEqual(85);
      logInfo(`new DslCss("", "", 0, "", "", 0, 0, "", 8...: subject.paddingRight=${subject.paddingRight}`);
      expect(subject.paddingRight).assertEqual(-100);
      logInfo(`${BUNDLE}DslCssCtor_0126 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0127
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0127
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 0, "", -100, -1, -100, -100, "Hello") initialises 10 public mem...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0127 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 0, '', -100, -1, -100, -100, 'Hello');
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
      expect(subject.paddingRight).assertEqual(-1);
      logInfo(`${BUNDLE}DslCssCtor_0127 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0128
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0128
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 0, "", -100, 0, -100, -100, "Hello") initialises 10 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0128 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 0, '', -100, 0, -100, -100, 'Hello');
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
      expect(subject.paddingRight).assertEqual(0);
      logInfo(`${BUNDLE}DslCssCtor_0128 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0129
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0129
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 0, "", -100, 1, -100, -100, "Hello") initialises 10 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0129 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 0, '', -100, 1, -100, -100, 'Hello');
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
      expect(subject.paddingRight).assertEqual(1);
      logInfo(`${BUNDLE}DslCssCtor_0129 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0130
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0130
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 0, "", -100, 50, -100, -100, "Hello") initialises 10 public mem...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0130 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 0, '', -100, 50, -100, -100, 'Hello');
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
      expect(subject.paddingRight).assertEqual(50);
      logInfo(`${BUNDLE}DslCssCtor_0130 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0131
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0131
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 0, "", -100, 100, -100, -100, "Hello") initialises 10 public me...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0131 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 0, '', -100, 100, -100, -100, 'Hello');
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
      expect(subject.paddingRight).assertEqual(100);
      logInfo(`${BUNDLE}DslCssCtor_0131 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0132
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0132
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 0, "", -100, 2, -100, -100, "Hello") initialises 10 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0132 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 0, '', -100, 2, -100, -100, 'Hello');
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
      expect(subject.paddingRight).assertEqual(2);
      logInfo(`${BUNDLE}DslCssCtor_0132 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0133
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0133
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 0, "", -100, 3, -100, -100, "Hello") initialises 10 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0133 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 0, '', -100, 3, -100, -100, 'Hello');
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
      expect(subject.paddingRight).assertEqual(3);
      logInfo(`${BUNDLE}DslCssCtor_0133 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0134
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0134
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 0, "", -100, 10, -100, -100, "Hello") initialises 10 public mem...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0134 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 0, '', -100, 10, -100, -100, 'Hello');
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
      expect(subject.paddingRight).assertEqual(10);
      logInfo(`${BUNDLE}DslCssCtor_0134 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0135
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0135
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 0, "", -100, 5, -100, -100, "Hello") initialises 10 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0135 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 0, '', -100, 5, -100, -100, 'Hello');
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
      expect(subject.paddingRight).assertEqual(5);
      logInfo(`${BUNDLE}DslCssCtor_0135 end`);
    });
  });
}
