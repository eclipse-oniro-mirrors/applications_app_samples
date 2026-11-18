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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import {
  prepareCase,
  finishCase,
  logSuite,
  downloadFilesData,
  selectDownloadPage,
  hasId,
} from '../Shared/SharedDriver';

export default function downloadTabsPart48Test(): void {
  describe('DownloadTabsPart48Test', (): void => {
    beforeAll((): void => {
      logSuite('DownloadTabsPart48Test', 'started');
    });
    beforeEach(async (): Promise<void> => {
      await prepareCase();
    });
    afterEach(async (): Promise<void> => {
      await finishCase();
    });
    afterAll((): void => {
      logSuite('DownloadTabsPart48Test', 'finished');
    });

    // @tc.number SAMPLE_DOWNLOAD_048_0100
    // @tc.name downloadTabsPart48Test001
    // @tc.desc Verify selectDownloadPage visibility path D-D-D-D-H-D-H-D-H-D
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadTabsPart48Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await selectDownloadPage(false);
      const shown1: boolean = await hasId('download');
      const expected1: boolean = true;
      expect(shown1).assertEqual(expected1);
      await selectDownloadPage(false);
      const shown2: boolean = await hasId('download');
      const expected2: boolean = true;
      expect(shown2).assertEqual(expected2);
      await selectDownloadPage(false);
      const shown3: boolean = await hasId('download');
      const expected3: boolean = true;
      expect(shown3).assertEqual(expected3);
      await selectDownloadPage(false);
      const shown4: boolean = await hasId('download');
      const expected4: boolean = true;
      expect(shown4).assertEqual(expected4);
      await selectDownloadPage(true);
      const shown5: boolean = await hasId('download');
      const expected5: boolean = false;
      expect(shown5).assertEqual(expected5);
      await selectDownloadPage(false);
      const shown6: boolean = await hasId('download');
      const expected6: boolean = true;
      expect(shown6).assertEqual(expected6);
      await selectDownloadPage(true);
      const shown7: boolean = await hasId('download');
      const expected7: boolean = false;
      expect(shown7).assertEqual(expected7);
      await selectDownloadPage(false);
      const shown8: boolean = await hasId('download');
      const expected8: boolean = true;
      expect(shown8).assertEqual(expected8);
      await selectDownloadPage(true);
      const shown9: boolean = await hasId('download');
      const expected9: boolean = false;
      expect(shown9).assertEqual(expected9);
      await selectDownloadPage(false);
      const shown10: boolean = await hasId('download');
      const expected10: boolean = true;
      expect(shown10).assertEqual(expected10);
    });

    // @tc.number SAMPLE_DOWNLOAD_048_0200
    // @tc.name downloadTabsPart48Test002
    // @tc.desc Verify selectDownloadPage visibility path D-D-D-D-H-D-H-D-H-H
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadTabsPart48Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await selectDownloadPage(false);
      const shown1: boolean = await hasId('download');
      const expected1: boolean = true;
      expect(shown1).assertEqual(expected1);
      await selectDownloadPage(false);
      const shown2: boolean = await hasId('download');
      const expected2: boolean = true;
      expect(shown2).assertEqual(expected2);
      await selectDownloadPage(false);
      const shown3: boolean = await hasId('download');
      const expected3: boolean = true;
      expect(shown3).assertEqual(expected3);
      await selectDownloadPage(false);
      const shown4: boolean = await hasId('download');
      const expected4: boolean = true;
      expect(shown4).assertEqual(expected4);
      await selectDownloadPage(true);
      const shown5: boolean = await hasId('download');
      const expected5: boolean = false;
      expect(shown5).assertEqual(expected5);
      await selectDownloadPage(false);
      const shown6: boolean = await hasId('download');
      const expected6: boolean = true;
      expect(shown6).assertEqual(expected6);
      await selectDownloadPage(true);
      const shown7: boolean = await hasId('download');
      const expected7: boolean = false;
      expect(shown7).assertEqual(expected7);
      await selectDownloadPage(false);
      const shown8: boolean = await hasId('download');
      const expected8: boolean = true;
      expect(shown8).assertEqual(expected8);
      await selectDownloadPage(true);
      const shown9: boolean = await hasId('download');
      const expected9: boolean = false;
      expect(shown9).assertEqual(expected9);
      await selectDownloadPage(true);
      const shown10: boolean = await hasId('download');
      const expected10: boolean = false;
      expect(shown10).assertEqual(expected10);
    });
  });
}
