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

/** Logic checks for new DslCss (41 cases). */
export default function dslCssCtor6Test(): void {
  describe('DslCssCtor6Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0224
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0224
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 0, "", -100, -100, 1, -100, "Hello") initialises 10 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0224 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 0, '', -100, -100, 1, -100, 'Hello');
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
      logInfo(`${BUNDLE}DslCssCtor_0224 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0225
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0225
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 0, "", -100, -100, 50, -100, "Hello") initialises 10 public mem...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0225 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 0, '', -100, -100, 50, -100, 'Hello');
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
      logInfo(`${BUNDLE}DslCssCtor_0225 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0226
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0226
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 0, "", -100, -100, 100, -100, "Hello") initialises 10 public me...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0226 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 0, '', -100, -100, 100, -100, 'Hello');
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
      logInfo(`${BUNDLE}DslCssCtor_0226 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0227
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0227
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 0, "", -100, -100, 2, -100, "Hello") initialises 10 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0227 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 0, '', -100, -100, 2, -100, 'Hello');
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
      logInfo(`${BUNDLE}DslCssCtor_0227 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0228
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0228
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 0, "", -100, -100, 3, -100, "Hello") initialises 10 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0228 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 0, '', -100, -100, 3, -100, 'Hello');
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
      logInfo(`${BUNDLE}DslCssCtor_0228 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0229
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0229
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 0, "", -100, -100, 10, -100, "Hello") initialises 10 public mem...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0229 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 0, '', -100, -100, 10, -100, 'Hello');
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
      logInfo(`${BUNDLE}DslCssCtor_0229 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0230
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0230
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 0, "", -100, -100, 5, -100, "Hello") initialises 10 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0230 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 0, '', -100, -100, 5, -100, 'Hello');
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
      logInfo(`${BUNDLE}DslCssCtor_0230 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0231
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0231
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 0, "", -100, -100, 15, -100, "Hello") initialises 10 public mem...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0231 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 0, '', -100, -100, 15, -100, 'Hello');
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
      logInfo(`${BUNDLE}DslCssCtor_0231 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0232
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0232
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 0, "", -100, -100, 20, -100, "Hello") initialises 10 public mem...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0232 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 0, '', -100, -100, 20, -100, 'Hello');
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
      logInfo(`${BUNDLE}DslCssCtor_0232 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0233
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0233
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 0, "", -100, -100, 25, -100, "Hello") initialises 10 public mem...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0233 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 0, '', -100, -100, 25, -100, 'Hello');
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
      logInfo(`${BUNDLE}DslCssCtor_0233 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0234
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0234
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 0, "", -100, -100, 30, -100, "Hello") initialises 10 public mem...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0234 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 0, '', -100, -100, 30, -100, 'Hello');
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
      logInfo(`${BUNDLE}DslCssCtor_0234 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0235
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0235
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 0, "", -100, -100, 35, -100, "Hello") initialises 10 public mem...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0235 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 0, '', -100, -100, 35, -100, 'Hello');
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
      logInfo(`${BUNDLE}DslCssCtor_0235 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0236
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0236
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 0, "", -100, -100, 78.2, -100, "Hello") initialises 10 public m...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0236 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 0, '', -100, -100, 78.2, -100, 'Hello');
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
      logInfo(`${BUNDLE}DslCssCtor_0236 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0237
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0237
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 0, "", -100, -100, -100, -1, "Hello") initialises 10 public mem...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0237 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 0, '', -100, -100, -100, -1, 'Hello');
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
      logInfo(`${BUNDLE}DslCssCtor_0237 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0238
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0238
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 0, "", -100, -100, -100, 0, "Hello") initialises 10 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0238 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 0, '', -100, -100, -100, 0, 'Hello');
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
      logInfo(`${BUNDLE}DslCssCtor_0238 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0239
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0239
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 0, "", -100, -100, -100, 1, "Hello") initialises 10 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0239 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 0, '', -100, -100, -100, 1, 'Hello');
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
      logInfo(`${BUNDLE}DslCssCtor_0239 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0240
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0240
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 0, "", -100, -100, -100, 50, "Hello") initialises 10 public mem...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0240 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 0, '', -100, -100, -100, 50, 'Hello');
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
      logInfo(`${BUNDLE}DslCssCtor_0240 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0241
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0241
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 0, "", -100, -100, -100, 100, "Hello") initialises 10 public me...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0241 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 0, '', -100, -100, -100, 100, 'Hello');
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
      logInfo(`${BUNDLE}DslCssCtor_0241 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0242
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0242
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 0, "", -100, -100, -100, 2, "Hello") initialises 10 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0242 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 0, '', -100, -100, -100, 2, 'Hello');
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
      logInfo(`${BUNDLE}DslCssCtor_0242 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0243
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0243
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 0, "", -100, -100, -100, 3, "Hello") initialises 10 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0243 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 0, '', -100, -100, -100, 3, 'Hello');
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
      logInfo(`${BUNDLE}DslCssCtor_0243 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0244
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0244
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 0, "", -100, -100, -100, 10, "Hello") initialises 10 public mem...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0244 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 0, '', -100, -100, -100, 10, 'Hello');
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
      logInfo(`${BUNDLE}DslCssCtor_0244 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0245
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0245
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 0, "", -100, -100, -100, 5, "Hello") initialises 10 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0245 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 0, '', -100, -100, -100, 5, 'Hello');
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
      logInfo(`${BUNDLE}DslCssCtor_0245 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0246
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0246
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 0, "", -100, -100, -100, 15, "Hello") initialises 10 public mem...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0246 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 0, '', -100, -100, -100, 15, 'Hello');
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
      logInfo(`${BUNDLE}DslCssCtor_0246 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0247
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0247
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 0, "", -100, -100, -100, 20, "Hello") initialises 10 public mem...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0247 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 0, '', -100, -100, -100, 20, 'Hello');
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
      logInfo(`${BUNDLE}DslCssCtor_0247 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0248
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0248
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 0, "", -100, -100, -100, 25, "Hello") initialises 10 public mem...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0248 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 0, '', -100, -100, -100, 25, 'Hello');
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
      logInfo(`${BUNDLE}DslCssCtor_0248 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0249
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0249
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 0, "", -100, -100, -100, 30, "Hello") initialises 10 public mem...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0249 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 0, '', -100, -100, -100, 30, 'Hello');
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
      logInfo(`${BUNDLE}DslCssCtor_0249 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0250
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0250
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 0, "", -100, -100, -100, 35, "Hello") initialises 10 public mem...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0250 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 0, '', -100, -100, -100, 35, 'Hello');
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
      logInfo(`${BUNDLE}DslCssCtor_0250 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0251
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0251
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 0, "", -100, -100, -100, 145, "Hello") initialises 10 public me...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0251 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 0, '', -100, -100, -100, 145, 'Hello');
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
      logInfo(`${BUNDLE}DslCssCtor_0251 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0252
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0252
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 0, "", -100, -100, -100, -100, "hello world") initialises 10 pu...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0252 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 0, '', -100, -100, -100, -100, 'hello world');
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
      logInfo(`${BUNDLE}DslCssCtor_0252 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0253
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0253
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 0, "", -100, -100, -100, -100, "") initialises 10 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0253 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 0, '', -100, -100, -100, -100, '');
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
      logInfo(`${BUNDLE}DslCssCtor_0253 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0254
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0254
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 0, "", -100, -100, -100, -100, " ") initialises 10 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0254 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 0, '', -100, -100, -100, -100, ' ');
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
      logInfo(`${BUNDLE}DslCssCtor_0254 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0255
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0255
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 0, "", -100, -100, -100, -100, "A") initialises 10 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0255 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 0, '', -100, -100, -100, -100, 'A');
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
      logInfo(`${BUNDLE}DslCssCtor_0255 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0256
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0256
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 0, "", -100, -100, -100, -100, "Sample Title 123") initialises ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0256 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 0, '', -100, -100, -100, -100, 'Sample Title 123');
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
      logInfo(`${BUNDLE}DslCssCtor_0256 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0257
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0257
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 0, "", -100, -100, -100, -100, "??") initialises 10 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0257', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0257 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 0, '', -100, -100, -100, -100, '\u4e2d\u6587');
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
      logInfo(`${BUNDLE}DslCssCtor_0257 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0258
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0258
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 0, "", -100, -100, -100, -100, "a") initialises 10 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0258', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0258 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 0, '', -100, -100, -100, -100, 'a');
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
      logInfo(`${BUNDLE}DslCssCtor_0258 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0259
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0259
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 0, "", -100, -100, -100, -100, "abc") initialises 10 public mem...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0259', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0259 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 0, '', -100, -100, -100, -100, 'abc');
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
      logInfo(`${BUNDLE}DslCssCtor_0259 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0260
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0260
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 0, "", -100, -100, -100, -100, "Hello World") initialises 10 pu...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0260', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0260 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 0, '', -100, -100, -100, -100, 'Hello World');
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
      logInfo(`${BUNDLE}DslCssCtor_0260 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0261
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0261
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 0, "", -100, -100, -100, -100, "123") initialises 10 public mem...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0261', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0261 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 0, '', -100, -100, -100, -100, '123');
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
      logInfo(`${BUNDLE}DslCssCtor_0261 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0262
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0262
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 0, "", -100, -100, -100, -100, " Hello ") initialises 10 public...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0262', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0262 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 0, '', -100, -100, -100, -100, ' Hello ');
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
      logInfo(`${BUNDLE}DslCssCtor_0262 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0263
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0263
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 0, "", -100, -100, -100, -100, "HelloHello") initialises 10 pub...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0263', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0263 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 0, '', -100, -100, -100, -100, 'HelloHello');
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
      logInfo(`${BUNDLE}DslCssCtor_0263 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSL_CSS_CTOR_0264
     * @tc.name      ImperativeDynamicLayouts_DslCssCtor_0264
     * @tc.desc      new DslCss("", "", 0, "", "", 0, 0, "", -100, -100, -100, -100, "Hello_1") initialises 10 public...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DslCssCtor_0264', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DslCssCtor_0264 begin`);
      const subject: DslCss = new DslCss('', '', 0, '', '', 0, 0, '', -100, -100, -100, -100, 'Hello_1');
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
      logInfo(`${BUNDLE}DslCssCtor_0264 end`);
    });
  });
}
