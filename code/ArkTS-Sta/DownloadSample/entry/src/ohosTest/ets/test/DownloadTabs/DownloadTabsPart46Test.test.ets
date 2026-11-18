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

export default function downloadTabsPart46Test(): void {
  describe('DownloadTabsPart46Test', (): void => {
    beforeAll((): void => {
      logSuite('DownloadTabsPart46Test', 'started');
    });
    beforeEach(async (): Promise<void> => {
      await prepareCase();
    });
    afterEach(async (): Promise<void> => {
      await finishCase();
    });
    afterAll((): void => {
      logSuite('DownloadTabsPart46Test', 'finished');
    });

    // @tc.number SAMPLE_DOWNLOAD_046_0100
    // @tc.name downloadTabsPart46Test001
    // @tc.desc Verify selectDownloadPage visibility path D-D-D-D-D-H-D-H-D-H
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadTabsPart46Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
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
      await selectDownloadPage(false);
      const shown5: boolean = await hasId('download');
      const expected5: boolean = true;
      expect(shown5).assertEqual(expected5);
      await selectDownloadPage(true);
      const shown6: boolean = await hasId('download');
      const expected6: boolean = false;
      expect(shown6).assertEqual(expected6);
      await selectDownloadPage(false);
      const shown7: boolean = await hasId('download');
      const expected7: boolean = true;
      expect(shown7).assertEqual(expected7);
      await selectDownloadPage(true);
      const shown8: boolean = await hasId('download');
      const expected8: boolean = false;
      expect(shown8).assertEqual(expected8);
      await selectDownloadPage(false);
      const shown9: boolean = await hasId('download');
      const expected9: boolean = true;
      expect(shown9).assertEqual(expected9);
      await selectDownloadPage(true);
      const shown10: boolean = await hasId('download');
      const expected10: boolean = false;
      expect(shown10).assertEqual(expected10);
    });

    // @tc.number SAMPLE_DOWNLOAD_046_0200
    // @tc.name downloadTabsPart46Test002
    // @tc.desc Verify selectDownloadPage visibility path D-D-D-D-D-H-D-H-H-D
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadTabsPart46Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
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
      await selectDownloadPage(false);
      const shown5: boolean = await hasId('download');
      const expected5: boolean = true;
      expect(shown5).assertEqual(expected5);
      await selectDownloadPage(true);
      const shown6: boolean = await hasId('download');
      const expected6: boolean = false;
      expect(shown6).assertEqual(expected6);
      await selectDownloadPage(false);
      const shown7: boolean = await hasId('download');
      const expected7: boolean = true;
      expect(shown7).assertEqual(expected7);
      await selectDownloadPage(true);
      const shown8: boolean = await hasId('download');
      const expected8: boolean = false;
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

    // @tc.number SAMPLE_DOWNLOAD_046_0300
    // @tc.name downloadTabsPart46Test003
    // @tc.desc Verify selectDownloadPage visibility path D-D-D-D-D-H-D-H-H-H
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadTabsPart46Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
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
      await selectDownloadPage(false);
      const shown5: boolean = await hasId('download');
      const expected5: boolean = true;
      expect(shown5).assertEqual(expected5);
      await selectDownloadPage(true);
      const shown6: boolean = await hasId('download');
      const expected6: boolean = false;
      expect(shown6).assertEqual(expected6);
      await selectDownloadPage(false);
      const shown7: boolean = await hasId('download');
      const expected7: boolean = true;
      expect(shown7).assertEqual(expected7);
      await selectDownloadPage(true);
      const shown8: boolean = await hasId('download');
      const expected8: boolean = false;
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

    // @tc.number SAMPLE_DOWNLOAD_046_0400
    // @tc.name downloadTabsPart46Test004
    // @tc.desc Verify selectDownloadPage visibility path D-D-D-D-D-H-H-D-D-D
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadTabsPart46Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
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
      await selectDownloadPage(false);
      const shown5: boolean = await hasId('download');
      const expected5: boolean = true;
      expect(shown5).assertEqual(expected5);
      await selectDownloadPage(true);
      const shown6: boolean = await hasId('download');
      const expected6: boolean = false;
      expect(shown6).assertEqual(expected6);
      await selectDownloadPage(true);
      const shown7: boolean = await hasId('download');
      const expected7: boolean = false;
      expect(shown7).assertEqual(expected7);
      await selectDownloadPage(false);
      const shown8: boolean = await hasId('download');
      const expected8: boolean = true;
      expect(shown8).assertEqual(expected8);
      await selectDownloadPage(false);
      const shown9: boolean = await hasId('download');
      const expected9: boolean = true;
      expect(shown9).assertEqual(expected9);
      await selectDownloadPage(false);
      const shown10: boolean = await hasId('download');
      const expected10: boolean = true;
      expect(shown10).assertEqual(expected10);
    });

    // @tc.number SAMPLE_DOWNLOAD_046_0500
    // @tc.name downloadTabsPart46Test005
    // @tc.desc Verify selectDownloadPage visibility path D-D-D-D-D-H-H-D-D-H
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadTabsPart46Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
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
      await selectDownloadPage(false);
      const shown5: boolean = await hasId('download');
      const expected5: boolean = true;
      expect(shown5).assertEqual(expected5);
      await selectDownloadPage(true);
      const shown6: boolean = await hasId('download');
      const expected6: boolean = false;
      expect(shown6).assertEqual(expected6);
      await selectDownloadPage(true);
      const shown7: boolean = await hasId('download');
      const expected7: boolean = false;
      expect(shown7).assertEqual(expected7);
      await selectDownloadPage(false);
      const shown8: boolean = await hasId('download');
      const expected8: boolean = true;
      expect(shown8).assertEqual(expected8);
      await selectDownloadPage(false);
      const shown9: boolean = await hasId('download');
      const expected9: boolean = true;
      expect(shown9).assertEqual(expected9);
      await selectDownloadPage(true);
      const shown10: boolean = await hasId('download');
      const expected10: boolean = false;
      expect(shown10).assertEqual(expected10);
    });

    // @tc.number SAMPLE_DOWNLOAD_046_0600
    // @tc.name downloadTabsPart46Test006
    // @tc.desc Verify selectDownloadPage visibility path D-D-D-D-D-H-H-D-H-D
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadTabsPart46Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
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
      await selectDownloadPage(false);
      const shown5: boolean = await hasId('download');
      const expected5: boolean = true;
      expect(shown5).assertEqual(expected5);
      await selectDownloadPage(true);
      const shown6: boolean = await hasId('download');
      const expected6: boolean = false;
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

    // @tc.number SAMPLE_DOWNLOAD_046_0700
    // @tc.name downloadTabsPart46Test007
    // @tc.desc Verify selectDownloadPage visibility path D-D-D-D-D-H-H-D-H-H
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadTabsPart46Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
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
      await selectDownloadPage(false);
      const shown5: boolean = await hasId('download');
      const expected5: boolean = true;
      expect(shown5).assertEqual(expected5);
      await selectDownloadPage(true);
      const shown6: boolean = await hasId('download');
      const expected6: boolean = false;
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

    // @tc.number SAMPLE_DOWNLOAD_046_0800
    // @tc.name downloadTabsPart46Test008
    // @tc.desc Verify selectDownloadPage visibility path D-D-D-D-D-H-H-H-D-D
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadTabsPart46Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
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
      await selectDownloadPage(false);
      const shown5: boolean = await hasId('download');
      const expected5: boolean = true;
      expect(shown5).assertEqual(expected5);
      await selectDownloadPage(true);
      const shown6: boolean = await hasId('download');
      const expected6: boolean = false;
      expect(shown6).assertEqual(expected6);
      await selectDownloadPage(true);
      const shown7: boolean = await hasId('download');
      const expected7: boolean = false;
      expect(shown7).assertEqual(expected7);
      await selectDownloadPage(true);
      const shown8: boolean = await hasId('download');
      const expected8: boolean = false;
      expect(shown8).assertEqual(expected8);
      await selectDownloadPage(false);
      const shown9: boolean = await hasId('download');
      const expected9: boolean = true;
      expect(shown9).assertEqual(expected9);
      await selectDownloadPage(false);
      const shown10: boolean = await hasId('download');
      const expected10: boolean = true;
      expect(shown10).assertEqual(expected10);
    });

    // @tc.number SAMPLE_DOWNLOAD_046_0900
    // @tc.name downloadTabsPart46Test009
    // @tc.desc Verify selectDownloadPage visibility path D-D-D-D-D-H-H-H-D-H
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadTabsPart46Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
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
      await selectDownloadPage(false);
      const shown5: boolean = await hasId('download');
      const expected5: boolean = true;
      expect(shown5).assertEqual(expected5);
      await selectDownloadPage(true);
      const shown6: boolean = await hasId('download');
      const expected6: boolean = false;
      expect(shown6).assertEqual(expected6);
      await selectDownloadPage(true);
      const shown7: boolean = await hasId('download');
      const expected7: boolean = false;
      expect(shown7).assertEqual(expected7);
      await selectDownloadPage(true);
      const shown8: boolean = await hasId('download');
      const expected8: boolean = false;
      expect(shown8).assertEqual(expected8);
      await selectDownloadPage(false);
      const shown9: boolean = await hasId('download');
      const expected9: boolean = true;
      expect(shown9).assertEqual(expected9);
      await selectDownloadPage(true);
      const shown10: boolean = await hasId('download');
      const expected10: boolean = false;
      expect(shown10).assertEqual(expected10);
    });

    // @tc.number SAMPLE_DOWNLOAD_046_1000
    // @tc.name downloadTabsPart46Test010
    // @tc.desc Verify selectDownloadPage visibility path D-D-D-D-D-H-H-H-H-D
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadTabsPart46Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
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
      await selectDownloadPage(false);
      const shown5: boolean = await hasId('download');
      const expected5: boolean = true;
      expect(shown5).assertEqual(expected5);
      await selectDownloadPage(true);
      const shown6: boolean = await hasId('download');
      const expected6: boolean = false;
      expect(shown6).assertEqual(expected6);
      await selectDownloadPage(true);
      const shown7: boolean = await hasId('download');
      const expected7: boolean = false;
      expect(shown7).assertEqual(expected7);
      await selectDownloadPage(true);
      const shown8: boolean = await hasId('download');
      const expected8: boolean = false;
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

    // @tc.number SAMPLE_DOWNLOAD_046_1100
    // @tc.name downloadTabsPart46Test011
    // @tc.desc Verify selectDownloadPage visibility path D-D-D-D-D-H-H-H-H-H
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadTabsPart46Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
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
      await selectDownloadPage(false);
      const shown5: boolean = await hasId('download');
      const expected5: boolean = true;
      expect(shown5).assertEqual(expected5);
      await selectDownloadPage(true);
      const shown6: boolean = await hasId('download');
      const expected6: boolean = false;
      expect(shown6).assertEqual(expected6);
      await selectDownloadPage(true);
      const shown7: boolean = await hasId('download');
      const expected7: boolean = false;
      expect(shown7).assertEqual(expected7);
      await selectDownloadPage(true);
      const shown8: boolean = await hasId('download');
      const expected8: boolean = false;
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
