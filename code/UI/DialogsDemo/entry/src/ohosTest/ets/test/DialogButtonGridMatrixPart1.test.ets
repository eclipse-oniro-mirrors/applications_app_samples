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
import { delayTick } from './shared/AsyncYield';
import { buildPrimaryButton, buildSecondaryButton } from '../../../main/ets/model/DialogModels';

import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF816;
const TAG: string = '[Sample_DialogsDemo]';

export default function DialogButtonGridMatrixPart1Test(): void {
  describe('DialogButtonGridMatrixPart1', () => {

    /**
     * @tc.number    SUB_DIALOGS_DBGP1_0100
     * @tc.name      testButtonContent0001
     * @tc.desc      Verify primary button content ''.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testButtonContent0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonContent0001 begin');
      await delayTick();
      const btn = buildPrimaryButton('');
      expect(btn.content).assertEqual('');
      expect(btn.buttonStyle).assertEqual(ButtonStyleMode.EMPHASIZED);
      expect(btn.action === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonContent0001 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DBGP1_0200
     * @tc.name      testButtonContent0002
     * @tc.desc      Verify secondary button content ''.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testButtonContent0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonContent0002 begin');
      await delayTick();
      const btn = buildSecondaryButton('');
      expect(btn.content).assertEqual('');
      expect(btn.buttonStyle).assertEqual(ButtonStyleMode.TEXTUAL);
      expect(btn.action === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonContent0002 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DBGP1_0300
     * @tc.name      testButtonContent0003
     * @tc.desc      Verify primary button content 'OK'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testButtonContent0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonContent0003 begin');
      await delayTick();
      const btn = buildPrimaryButton('OK');
      expect(btn.content).assertEqual('OK');
      expect(btn.buttonStyle).assertEqual(ButtonStyleMode.EMPHASIZED);
      expect(btn.action === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonContent0003 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DBGP1_0400
     * @tc.name      testButtonContent0004
     * @tc.desc      Verify secondary button content 'OK'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testButtonContent0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonContent0004 begin');
      await delayTick();
      const btn = buildSecondaryButton('OK');
      expect(btn.content).assertEqual('OK');
      expect(btn.buttonStyle).assertEqual(ButtonStyleMode.TEXTUAL);
      expect(btn.action === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonContent0004 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DBGP1_0500
     * @tc.name      testButtonContent0005
     * @tc.desc      Verify primary button content '确定'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testButtonContent0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonContent0005 begin');
      await delayTick();
      const btn = buildPrimaryButton('确定');
      expect(btn.content).assertEqual('确定');
      expect(btn.buttonStyle).assertEqual(ButtonStyleMode.EMPHASIZED);
      expect(btn.action === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonContent0005 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DBGP1_0600
     * @tc.name      testButtonContent0006
     * @tc.desc      Verify secondary button content '确定'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testButtonContent0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonContent0006 begin');
      await delayTick();
      const btn = buildSecondaryButton('确定');
      expect(btn.content).assertEqual('确定');
      expect(btn.buttonStyle).assertEqual(ButtonStyleMode.TEXTUAL);
      expect(btn.action === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonContent0006 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DBGP1_0700
     * @tc.name      testButtonContent0007
     * @tc.desc      Verify primary button content 'Delete'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testButtonContent0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonContent0007 begin');
      await delayTick();
      const btn = buildPrimaryButton('Delete');
      expect(btn.content).assertEqual('Delete');
      expect(btn.buttonStyle).assertEqual(ButtonStyleMode.EMPHASIZED);
      expect(btn.action === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonContent0007 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DBGP1_0800
     * @tc.name      testButtonContent0008
     * @tc.desc      Verify secondary button content 'Delete'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testButtonContent0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonContent0008 begin');
      await delayTick();
      const btn = buildSecondaryButton('Delete');
      expect(btn.content).assertEqual('Delete');
      expect(btn.buttonStyle).assertEqual(ButtonStyleMode.TEXTUAL);
      expect(btn.action === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonContent0008 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DBGP1_0900
     * @tc.name      testButtonContent0009
     * @tc.desc      Verify primary button content '  spaced  '.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testButtonContent0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonContent0009 begin');
      await delayTick();
      const btn = buildPrimaryButton('  spaced  ');
      expect(btn.content).assertEqual('  spaced  ');
      expect(btn.buttonStyle).assertEqual(ButtonStyleMode.EMPHASIZED);
      expect(btn.action === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonContent0009 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DBGP1_1000
     * @tc.name      testButtonContent0010
     * @tc.desc      Verify secondary button content '  spaced  '.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testButtonContent0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonContent0010 begin');
      await delayTick();
      const btn = buildSecondaryButton('  spaced  ');
      expect(btn.content).assertEqual('  spaced  ');
      expect(btn.buttonStyle).assertEqual(ButtonStyleMode.TEXTUAL);
      expect(btn.action === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonContent0010 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DBGP1_1100
     * @tc.name      testButtonContent0011
     * @tc.desc      Verify primary button content 'a#b'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testButtonContent0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonContent0011 begin');
      await delayTick();
      const btn = buildPrimaryButton('a#b');
      expect(btn.content).assertEqual('a#b');
      expect(btn.buttonStyle).assertEqual(ButtonStyleMode.EMPHASIZED);
      expect(btn.action === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonContent0011 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DBGP1_1200
     * @tc.name      testButtonContent0012
     * @tc.desc      Verify secondary button content 'a#b'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testButtonContent0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonContent0012 begin');
      await delayTick();
      const btn = buildSecondaryButton('a#b');
      expect(btn.content).assertEqual('a#b');
      expect(btn.buttonStyle).assertEqual(ButtonStyleMode.TEXTUAL);
      expect(btn.action === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonContent0012 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DBGP1_1300
     * @tc.name      testButtonContent0013
     * @tc.desc      Verify primary button content 'line1\nline2'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testButtonContent0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonContent0013 begin');
      await delayTick();
      const btn = buildPrimaryButton('line1\nline2');
      expect(btn.content).assertEqual('line1\nline2');
      expect(btn.buttonStyle).assertEqual(ButtonStyleMode.EMPHASIZED);
      expect(btn.action === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonContent0013 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DBGP1_1400
     * @tc.name      testButtonContent0014
     * @tc.desc      Verify secondary button content 'line1\nline2'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testButtonContent0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonContent0014 begin');
      await delayTick();
      const btn = buildSecondaryButton('line1\nline2');
      expect(btn.content).assertEqual('line1\nline2');
      expect(btn.buttonStyle).assertEqual(ButtonStyleMode.TEXTUAL);
      expect(btn.action === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonContent0014 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DBGP1_1500
     * @tc.name      testButtonAction0015
     * @tc.desc      Verify primary action fires twice.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testButtonAction0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonAction0015 begin');
      await delayTick();
      let calls: number = 0;
      const btn = buildPrimaryButton("action", () => { calls++; });
      expect(btn.action === undefined).assertFalse();
      btn.action!();
      btn.action!();
      expect(calls).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonAction0015 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DBGP1_1600
     * @tc.name      testButtonAction0016
     * @tc.desc      Verify secondary action fires twice.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testButtonAction0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonAction0016 begin');
      await delayTick();
      let calls: number = 0;
      const btn = buildSecondaryButton("action", () => { calls++; });
      expect(btn.action === undefined).assertFalse();
      btn.action!();
      btn.action!();
      expect(calls).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonAction0016 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DBGP1_1700
     * @tc.name      testButtonDistinct0017
     * @tc.desc      Verify button instances are distinct and styles differ.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testButtonDistinct0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonDistinct0017 begin');
      await delayTick();
      const first = buildPrimaryButton("same");
      const second = buildPrimaryButton("same");
      const third = buildSecondaryButton("same");
      expect(first === second).assertFalse();
      expect(first === third).assertFalse();
      expect(first.content).assertEqual(second.content);
      expect(first.buttonStyle).assertEqual(ButtonStyleMode.EMPHASIZED);
      expect(third.buttonStyle).assertEqual(ButtonStyleMode.TEXTUAL);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonDistinct0017 end');
    })

  })
}
