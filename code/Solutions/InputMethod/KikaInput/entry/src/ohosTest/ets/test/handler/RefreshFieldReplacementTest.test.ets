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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import hilog from '@ohos.hilog';
import { yieldToEventLoop } from '../support/AsyncSupport';
import { InputHandler } from '../../../../main/ets/model/KeyboardController';
import { createClientHarness } from '../support/ClientHarness';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputRefreshFieldReplacement]';

export default function refreshFieldReplacementTest(): void {
  describe('RefreshFieldReplacementTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_REFRESH_FIELD_REPLACEMENT_0100
     * @tc.name      testRefreshFieldReplacement_001
     * @tc.desc      Verify that a second selection value overwrites the first in the refreshed summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testRefreshFieldReplacement_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRefreshFieldReplacement_001 begin');
      await createClientHarness(0);
      InputHandler.getInstance().setSelectInfo('SEL-first');
      InputHandler.getInstance().setSelectInfo('SEL-second');
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();
      const summary: string = AppStorage.get<string>('showLog') ?? '';
      expect(summary.indexOf('SEL-first')).assertEqual(-1);
      expect(summary.indexOf('SEL-second') >= 0).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testRefreshFieldReplacement_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_REFRESH_FIELD_REPLACEMENT_0200
     * @tc.name      testRefreshFieldReplacement_002
     * @tc.desc      Verify that a second text value overwrites the first without duplicating lines.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testRefreshFieldReplacement_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRefreshFieldReplacement_002 begin');
      await createClientHarness(0);
      InputHandler.getInstance().setTextInfo('TXT-old');
      InputHandler.getInstance().setTextInfo('TXT-new');
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();
      const summary: string = AppStorage.get<string>('showLog') ?? '';
      const lines: string[] = summary.split(String.fromCharCode(10));
      expect(lines.length).assertEqual(5);
      expect(summary.indexOf('TXT-old')).assertEqual(-1);
      expect(lines[3]).assertEqual('TXT-new');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testRefreshFieldReplacement_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_REFRESH_FIELD_REPLACEMENT_0300
     * @tc.name      testRefreshFieldReplacement_003
     * @tc.desc      Verify that the summary ends with the latest input value after two replacements.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testRefreshFieldReplacement_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRefreshFieldReplacement_003 begin');
      await createClientHarness(0);
      InputHandler.getInstance().setInputInfo('INP-one');
      InputHandler.getInstance().setInputInfo('INP-two');
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();
      const summary: string = AppStorage.get<string>('showLog') ?? '';
      expect(summary.endsWith('INP-two')).assertTrue();
      expect(summary.indexOf('INP-one')).assertEqual(-1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testRefreshFieldReplacement_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_REFRESH_FIELD_REPLACEMENT_0400
     * @tc.name      testRefreshFieldReplacement_004
     * @tc.desc      Verify that changing only the cursor value keeps the five summary lines stable.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testRefreshFieldReplacement_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRefreshFieldReplacement_004 begin');
      await createClientHarness(0);
      InputHandler.getInstance().setCursorInfo({ x: 1, y: 2, height: 3 });
      InputHandler.getInstance().refreshInfo();
      const first: string = AppStorage.get<string>('showLog') ?? '';
      InputHandler.getInstance().setCursorInfo({ x: 4, y: 5, height: 6 });
      InputHandler.getInstance().refreshInfo();
      const second: string = AppStorage.get<string>('showLog') ?? '';
      expect(first.split(String.fromCharCode(10)).length).assertEqual(5);
      expect(second.split(String.fromCharCode(10)).length).assertEqual(5);
      expect(first).assertEqual(second);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testRefreshFieldReplacement_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_REFRESH_FIELD_REPLACEMENT_0500
     * @tc.name      testRefreshFieldReplacement_005
     * @tc.desc      Verify that an empty selection still occupies its own line before the text value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testRefreshFieldReplacement_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRefreshFieldReplacement_005 begin');
      await createClientHarness(0);
      InputHandler.getInstance().setSelectInfo('');
      InputHandler.getInstance().setTextInfo('TXT-after-empty');
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();
      const summary: string = AppStorage.get<string>('showLog') ?? '';
      const lines: string[] = summary.split(String.fromCharCode(10));
      expect(lines[2]).assertEqual('');
      expect(lines[3]).assertEqual('TXT-after-empty');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testRefreshFieldReplacement_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_REFRESH_FIELD_REPLACEMENT_0600
     * @tc.name      testRefreshFieldReplacement_006
     * @tc.desc      Verify that stored fields still render after a stop while the window line is dropped.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testRefreshFieldReplacement_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRefreshFieldReplacement_006 begin');
      await createClientHarness(0);
      InputHandler.getInstance().setSelectInfo('SEL-stop');
      InputHandler.getInstance().setInputInfo('INP-stop');
      InputHandler.getInstance().onInputStop();
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();
      const summary: string = AppStorage.get<string>('showLog') ?? '';
      expect(summary.indexOf('five chars:')).assertEqual(-1);
      expect(summary.indexOf('SEL-stop') >= 0).assertTrue();
      expect(summary.endsWith('INP-stop')).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testRefreshFieldReplacement_006 end');
      await yieldToEventLoop();
    });

  });
}
