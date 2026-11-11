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
import { describe, it as hypiumIt, expect as hypiumExpect, beforeEach, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';

const TAG: string = '[Sample_MediaSourceAppStorageContract]';
const DOMAIN: number = 0xF812;

function it(name: string, filter: number, func: () => void | Promise<void>): void {
  hypiumIt(name, filter, async () => {
    hilog.info(DOMAIN, TAG, '%{public}s', name + ' begin');
    try {
      await func();
    } finally {
      hilog.info(DOMAIN, TAG, '%{public}s', name + ' end');
    }
  });
}

interface ExpectAssert {
  assertEqual(expectValue: string | number | boolean | Object | null | undefined): void;
  assertTrue(): void;
  assertFalse(): void;
  assertLarger(expectValue: number): void;
  assertLargerOrEqual(expectValue: number): void;
  assertLess(expectValue: number): void;
  assertLessOrEqual(expectValue: number): void;
  assertClose(expectValue: number, precision: number): void;
  assertUndefined(): void;
  assertFail(): void;
}

function expect(actual: string | number | boolean | Object | null | undefined): ExpectAssert {
  hilog.info(DOMAIN, TAG, '%{public}s', 'actual: ' + String(actual));
  return hypiumExpect(actual);
}

export default function mediaSourceAppStorageContractTest(): void {
  describe('mediaSourceAppStorageContractTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_APPSTOR_0001
     * @tc.name      testExtAppStorage0000
     * @tc.desc      AppStorage key ms_duration_0000 stores 0 then 7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtAppStorage0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'ms_duration_0000';
      const first: number = 0;
      const second: number = 7;
      AppStorage.setOrCreate<number>(key, first);
      expect(AppStorage.get<number>(key)).assertEqual(first);
      AppStorage.setOrCreate<number>(key, second);
      expect(AppStorage.get<number>(key)).assertEqual(second);
      expect(key.startsWith('ms_duration_')).assertTrue();
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_APPSTOR_0002
     * @tc.name      testExtAppStorage0001
     * @tc.desc      AppStorage key ms_duration_0001 stores 1 then 8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtAppStorage0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'ms_duration_0001';
      const first: number = 1;
      const second: number = 8;
      AppStorage.setOrCreate<number>(key, first);
      expect(AppStorage.get<number>(key)).assertEqual(first);
      AppStorage.setOrCreate<number>(key, second);
      expect(AppStorage.get<number>(key)).assertEqual(second);
      expect(key.startsWith('ms_duration_')).assertTrue();
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_APPSTOR_0003
     * @tc.name      testExtAppStorage0002
     * @tc.desc      AppStorage key ms_duration_0002 stores 1000 then 1007.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtAppStorage0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'ms_duration_0002';
      const first: number = 1000;
      const second: number = 1007;
      AppStorage.setOrCreate<number>(key, first);
      expect(AppStorage.get<number>(key)).assertEqual(first);
      AppStorage.setOrCreate<number>(key, second);
      expect(AppStorage.get<number>(key)).assertEqual(second);
      expect(key.startsWith('ms_duration_')).assertTrue();
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_APPSTOR_0004
     * @tc.name      testExtAppStorage0003
     * @tc.desc      AppStorage key ms_duration_0003 stores 60000 then 60007.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtAppStorage0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'ms_duration_0003';
      const first: number = 60000;
      const second: number = 60007;
      AppStorage.setOrCreate<number>(key, first);
      expect(AppStorage.get<number>(key)).assertEqual(first);
      AppStorage.setOrCreate<number>(key, second);
      expect(AppStorage.get<number>(key)).assertEqual(second);
      expect(key.startsWith('ms_duration_')).assertTrue();
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_APPSTOR_0005
     * @tc.name      testExtAppStorage0004
     * @tc.desc      AppStorage key ms_duration_0004 stores 3599000 then 3599007.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtAppStorage0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'ms_duration_0004';
      const first: number = 3599000;
      const second: number = 3599007;
      AppStorage.setOrCreate<number>(key, first);
      expect(AppStorage.get<number>(key)).assertEqual(first);
      AppStorage.setOrCreate<number>(key, second);
      expect(AppStorage.get<number>(key)).assertEqual(second);
      expect(key.startsWith('ms_duration_')).assertTrue();
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_APPSTOR_0006
     * @tc.name      testExtAppStorage0005
     * @tc.desc      AppStorage key ms_duration_0005 stores -1 then 6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtAppStorage0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'ms_duration_0005';
      const first: number = -1;
      const second: number = 6;
      AppStorage.setOrCreate<number>(key, first);
      expect(AppStorage.get<number>(key)).assertEqual(first);
      AppStorage.setOrCreate<number>(key, second);
      expect(AppStorage.get<number>(key)).assertEqual(second);
      expect(key.startsWith('ms_duration_')).assertTrue();
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_APPSTOR_0007
     * @tc.name      testExtAppStorage0006
     * @tc.desc      AppStorage key ms_duration_0006 stores 42 then 49.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtAppStorage0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'ms_duration_0006';
      const first: number = 42;
      const second: number = 49;
      AppStorage.setOrCreate<number>(key, first);
      expect(AppStorage.get<number>(key)).assertEqual(first);
      AppStorage.setOrCreate<number>(key, second);
      expect(AppStorage.get<number>(key)).assertEqual(second);
      expect(key.startsWith('ms_duration_')).assertTrue();
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_APPSTOR_0008
     * @tc.name      testExtAppStorage0007
     * @tc.desc      AppStorage key ms_duration_0007 stores 999999 then 1000006.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtAppStorage0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'ms_duration_0007';
      const first: number = 999999;
      const second: number = 1000006;
      AppStorage.setOrCreate<number>(key, first);
      expect(AppStorage.get<number>(key)).assertEqual(first);
      AppStorage.setOrCreate<number>(key, second);
      expect(AppStorage.get<number>(key)).assertEqual(second);
      expect(key.startsWith('ms_duration_')).assertTrue();
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_APPSTOR_0009
     * @tc.name      testExtAppStorage0008
     * @tc.desc      AppStorage key ms_duration_0008 stores 0 then 7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtAppStorage0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'ms_duration_0008';
      const first: number = 0;
      const second: number = 7;
      AppStorage.setOrCreate<number>(key, first);
      expect(AppStorage.get<number>(key)).assertEqual(first);
      AppStorage.setOrCreate<number>(key, second);
      expect(AppStorage.get<number>(key)).assertEqual(second);
      expect(key.startsWith('ms_duration_')).assertTrue();
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_APPSTOR_0010
     * @tc.name      testExtAppStorage0009
     * @tc.desc      AppStorage key ms_duration_0009 stores 1 then 8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtAppStorage0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'ms_duration_0009';
      const first: number = 1;
      const second: number = 8;
      AppStorage.setOrCreate<number>(key, first);
      expect(AppStorage.get<number>(key)).assertEqual(first);
      AppStorage.setOrCreate<number>(key, second);
      expect(AppStorage.get<number>(key)).assertEqual(second);
      expect(key.startsWith('ms_duration_')).assertTrue();
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_APPSTOR_0011
     * @tc.name      testExtAppStorage0010
     * @tc.desc      AppStorage key ms_duration_0010 stores 1000 then 1007.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtAppStorage0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'ms_duration_0010';
      const first: number = 1000;
      const second: number = 1007;
      AppStorage.setOrCreate<number>(key, first);
      expect(AppStorage.get<number>(key)).assertEqual(first);
      AppStorage.setOrCreate<number>(key, second);
      expect(AppStorage.get<number>(key)).assertEqual(second);
      expect(key.startsWith('ms_duration_')).assertTrue();
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_APPSTOR_0012
     * @tc.name      testExtAppStorage0011
     * @tc.desc      AppStorage key ms_duration_0011 stores 60000 then 60007.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtAppStorage0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'ms_duration_0011';
      const first: number = 60000;
      const second: number = 60007;
      AppStorage.setOrCreate<number>(key, first);
      expect(AppStorage.get<number>(key)).assertEqual(first);
      AppStorage.setOrCreate<number>(key, second);
      expect(AppStorage.get<number>(key)).assertEqual(second);
      expect(key.startsWith('ms_duration_')).assertTrue();
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_APPSTOR_0013
     * @tc.name      testExtAppStorage0012
     * @tc.desc      AppStorage key ms_duration_0012 stores 3599000 then 3599007.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtAppStorage0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'ms_duration_0012';
      const first: number = 3599000;
      const second: number = 3599007;
      AppStorage.setOrCreate<number>(key, first);
      expect(AppStorage.get<number>(key)).assertEqual(first);
      AppStorage.setOrCreate<number>(key, second);
      expect(AppStorage.get<number>(key)).assertEqual(second);
      expect(key.startsWith('ms_duration_')).assertTrue();
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_APPSTOR_0014
     * @tc.name      testExtAppStorage0013
     * @tc.desc      AppStorage key ms_duration_0013 stores -1 then 6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtAppStorage0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'ms_duration_0013';
      const first: number = -1;
      const second: number = 6;
      AppStorage.setOrCreate<number>(key, first);
      expect(AppStorage.get<number>(key)).assertEqual(first);
      AppStorage.setOrCreate<number>(key, second);
      expect(AppStorage.get<number>(key)).assertEqual(second);
      expect(key.startsWith('ms_duration_')).assertTrue();
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_APPSTOR_0015
     * @tc.name      testExtAppStorage0014
     * @tc.desc      AppStorage key ms_duration_0014 stores 42 then 49.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtAppStorage0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'ms_duration_0014';
      const first: number = 42;
      const second: number = 49;
      AppStorage.setOrCreate<number>(key, first);
      expect(AppStorage.get<number>(key)).assertEqual(first);
      AppStorage.setOrCreate<number>(key, second);
      expect(AppStorage.get<number>(key)).assertEqual(second);
      expect(key.startsWith('ms_duration_')).assertTrue();
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_APPSTOR_0016
     * @tc.name      testExtAppStorage0015
     * @tc.desc      AppStorage key ms_duration_0015 stores 999999 then 1000006.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtAppStorage0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'ms_duration_0015';
      const first: number = 999999;
      const second: number = 1000006;
      AppStorage.setOrCreate<number>(key, first);
      expect(AppStorage.get<number>(key)).assertEqual(first);
      AppStorage.setOrCreate<number>(key, second);
      expect(AppStorage.get<number>(key)).assertEqual(second);
      expect(key.startsWith('ms_duration_')).assertTrue();
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_APPSTOR_0017
     * @tc.name      testExtAppStorage0016
     * @tc.desc      AppStorage key ms_duration_0016 stores 0 then 7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtAppStorage0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'ms_duration_0016';
      const first: number = 0;
      const second: number = 7;
      AppStorage.setOrCreate<number>(key, first);
      expect(AppStorage.get<number>(key)).assertEqual(first);
      AppStorage.setOrCreate<number>(key, second);
      expect(AppStorage.get<number>(key)).assertEqual(second);
      expect(key.startsWith('ms_duration_')).assertTrue();
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_APPSTOR_0018
     * @tc.name      testExtAppStorage0017
     * @tc.desc      AppStorage key ms_duration_0017 stores 1 then 8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtAppStorage0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'ms_duration_0017';
      const first: number = 1;
      const second: number = 8;
      AppStorage.setOrCreate<number>(key, first);
      expect(AppStorage.get<number>(key)).assertEqual(first);
      AppStorage.setOrCreate<number>(key, second);
      expect(AppStorage.get<number>(key)).assertEqual(second);
      expect(key.startsWith('ms_duration_')).assertTrue();
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_APPSTOR_0019
     * @tc.name      testExtAppStorage0018
     * @tc.desc      AppStorage key ms_duration_0018 stores 1000 then 1007.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtAppStorage0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'ms_duration_0018';
      const first: number = 1000;
      const second: number = 1007;
      AppStorage.setOrCreate<number>(key, first);
      expect(AppStorage.get<number>(key)).assertEqual(first);
      AppStorage.setOrCreate<number>(key, second);
      expect(AppStorage.get<number>(key)).assertEqual(second);
      expect(key.startsWith('ms_duration_')).assertTrue();
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_APPSTOR_0020
     * @tc.name      testExtAppStorage0019
     * @tc.desc      AppStorage key ms_duration_0019 stores 60000 then 60007.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtAppStorage0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'ms_duration_0019';
      const first: number = 60000;
      const second: number = 60007;
      AppStorage.setOrCreate<number>(key, first);
      expect(AppStorage.get<number>(key)).assertEqual(first);
      AppStorage.setOrCreate<number>(key, second);
      expect(AppStorage.get<number>(key)).assertEqual(second);
      expect(key.startsWith('ms_duration_')).assertTrue();
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_APPSTOR_0021
     * @tc.name      testExtAppStorage0020
     * @tc.desc      AppStorage key ms_duration_0020 stores 3599000 then 3599007.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtAppStorage0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'ms_duration_0020';
      const first: number = 3599000;
      const second: number = 3599007;
      AppStorage.setOrCreate<number>(key, first);
      expect(AppStorage.get<number>(key)).assertEqual(first);
      AppStorage.setOrCreate<number>(key, second);
      expect(AppStorage.get<number>(key)).assertEqual(second);
      expect(key.startsWith('ms_duration_')).assertTrue();
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_APPSTOR_0022
     * @tc.name      testExtAppStorage0021
     * @tc.desc      AppStorage key ms_duration_0021 stores -1 then 6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtAppStorage0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'ms_duration_0021';
      const first: number = -1;
      const second: number = 6;
      AppStorage.setOrCreate<number>(key, first);
      expect(AppStorage.get<number>(key)).assertEqual(first);
      AppStorage.setOrCreate<number>(key, second);
      expect(AppStorage.get<number>(key)).assertEqual(second);
      expect(key.startsWith('ms_duration_')).assertTrue();
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_APPSTOR_0023
     * @tc.name      testExtAppStorage0022
     * @tc.desc      AppStorage key ms_duration_0022 stores 42 then 49.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtAppStorage0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'ms_duration_0022';
      const first: number = 42;
      const second: number = 49;
      AppStorage.setOrCreate<number>(key, first);
      expect(AppStorage.get<number>(key)).assertEqual(first);
      AppStorage.setOrCreate<number>(key, second);
      expect(AppStorage.get<number>(key)).assertEqual(second);
      expect(key.startsWith('ms_duration_')).assertTrue();
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_APPSTOR_0024
     * @tc.name      testExtAppStorage0023
     * @tc.desc      AppStorage key ms_duration_0023 stores 999999 then 1000006.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtAppStorage0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'ms_duration_0023';
      const first: number = 999999;
      const second: number = 1000006;
      AppStorage.setOrCreate<number>(key, first);
      expect(AppStorage.get<number>(key)).assertEqual(first);
      AppStorage.setOrCreate<number>(key, second);
      expect(AppStorage.get<number>(key)).assertEqual(second);
      expect(key.startsWith('ms_duration_')).assertTrue();
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_APPSTOR_0025
     * @tc.name      testExtAppStorage0024
     * @tc.desc      AppStorage key ms_duration_0024 stores 0 then 7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtAppStorage0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'ms_duration_0024';
      const first: number = 0;
      const second: number = 7;
      AppStorage.setOrCreate<number>(key, first);
      expect(AppStorage.get<number>(key)).assertEqual(first);
      AppStorage.setOrCreate<number>(key, second);
      expect(AppStorage.get<number>(key)).assertEqual(second);
      expect(key.startsWith('ms_duration_')).assertTrue();
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_APPSTOR_0026
     * @tc.name      testExtAppStorage0025
     * @tc.desc      AppStorage key ms_duration_0025 stores 1 then 8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtAppStorage0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'ms_duration_0025';
      const first: number = 1;
      const second: number = 8;
      AppStorage.setOrCreate<number>(key, first);
      expect(AppStorage.get<number>(key)).assertEqual(first);
      AppStorage.setOrCreate<number>(key, second);
      expect(AppStorage.get<number>(key)).assertEqual(second);
      expect(key.startsWith('ms_duration_')).assertTrue();
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_APPSTOR_0027
     * @tc.name      testExtAppStorage0026
     * @tc.desc      AppStorage key ms_duration_0026 stores 1000 then 1007.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtAppStorage0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'ms_duration_0026';
      const first: number = 1000;
      const second: number = 1007;
      AppStorage.setOrCreate<number>(key, first);
      expect(AppStorage.get<number>(key)).assertEqual(first);
      AppStorage.setOrCreate<number>(key, second);
      expect(AppStorage.get<number>(key)).assertEqual(second);
      expect(key.startsWith('ms_duration_')).assertTrue();
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_APPSTOR_0028
     * @tc.name      testExtAppStorage0027
     * @tc.desc      AppStorage key ms_duration_0027 stores 60000 then 60007.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtAppStorage0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'ms_duration_0027';
      const first: number = 60000;
      const second: number = 60007;
      AppStorage.setOrCreate<number>(key, first);
      expect(AppStorage.get<number>(key)).assertEqual(first);
      AppStorage.setOrCreate<number>(key, second);
      expect(AppStorage.get<number>(key)).assertEqual(second);
      expect(key.startsWith('ms_duration_')).assertTrue();
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_APPSTOR_0029
     * @tc.name      testExtAppStorage0028
     * @tc.desc      AppStorage key ms_duration_0028 stores 3599000 then 3599007.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtAppStorage0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'ms_duration_0028';
      const first: number = 3599000;
      const second: number = 3599007;
      AppStorage.setOrCreate<number>(key, first);
      expect(AppStorage.get<number>(key)).assertEqual(first);
      AppStorage.setOrCreate<number>(key, second);
      expect(AppStorage.get<number>(key)).assertEqual(second);
      expect(key.startsWith('ms_duration_')).assertTrue();
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_APPSTOR_0030
     * @tc.name      testExtAppStorage0029
     * @tc.desc      AppStorage key ms_duration_0029 stores -1 then 6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtAppStorage0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'ms_duration_0029';
      const first: number = -1;
      const second: number = 6;
      AppStorage.setOrCreate<number>(key, first);
      expect(AppStorage.get<number>(key)).assertEqual(first);
      AppStorage.setOrCreate<number>(key, second);
      expect(AppStorage.get<number>(key)).assertEqual(second);
      expect(key.startsWith('ms_duration_')).assertTrue();
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_APPSTOR_0031
     * @tc.name      testExtAppStorage0030
     * @tc.desc      AppStorage key ms_duration_0030 stores 42 then 49.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtAppStorage0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'ms_duration_0030';
      const first: number = 42;
      const second: number = 49;
      AppStorage.setOrCreate<number>(key, first);
      expect(AppStorage.get<number>(key)).assertEqual(first);
      AppStorage.setOrCreate<number>(key, second);
      expect(AppStorage.get<number>(key)).assertEqual(second);
      expect(key.startsWith('ms_duration_')).assertTrue();
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_APPSTOR_0032
     * @tc.name      testExtAppStorage0031
     * @tc.desc      AppStorage key ms_duration_0031 stores 999999 then 1000006.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtAppStorage0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'ms_duration_0031';
      const first: number = 999999;
      const second: number = 1000006;
      AppStorage.setOrCreate<number>(key, first);
      expect(AppStorage.get<number>(key)).assertEqual(first);
      AppStorage.setOrCreate<number>(key, second);
      expect(AppStorage.get<number>(key)).assertEqual(second);
      expect(key.startsWith('ms_duration_')).assertTrue();
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_APPSTOR_0033
     * @tc.name      testExtAppStorage0032
     * @tc.desc      AppStorage key ms_duration_0032 stores 0 then 7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtAppStorage0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'ms_duration_0032';
      const first: number = 0;
      const second: number = 7;
      AppStorage.setOrCreate<number>(key, first);
      expect(AppStorage.get<number>(key)).assertEqual(first);
      AppStorage.setOrCreate<number>(key, second);
      expect(AppStorage.get<number>(key)).assertEqual(second);
      expect(key.startsWith('ms_duration_')).assertTrue();
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_APPSTOR_0034
     * @tc.name      testExtAppStorage0033
     * @tc.desc      AppStorage key ms_duration_0033 stores 1 then 8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtAppStorage0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'ms_duration_0033';
      const first: number = 1;
      const second: number = 8;
      AppStorage.setOrCreate<number>(key, first);
      expect(AppStorage.get<number>(key)).assertEqual(first);
      AppStorage.setOrCreate<number>(key, second);
      expect(AppStorage.get<number>(key)).assertEqual(second);
      expect(key.startsWith('ms_duration_')).assertTrue();
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_APPSTOR_0035
     * @tc.name      testExtAppStorage0034
     * @tc.desc      AppStorage key ms_duration_0034 stores 1000 then 1007.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtAppStorage0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'ms_duration_0034';
      const first: number = 1000;
      const second: number = 1007;
      AppStorage.setOrCreate<number>(key, first);
      expect(AppStorage.get<number>(key)).assertEqual(first);
      AppStorage.setOrCreate<number>(key, second);
      expect(AppStorage.get<number>(key)).assertEqual(second);
      expect(key.startsWith('ms_duration_')).assertTrue();
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_APPSTOR_0036
     * @tc.name      testExtAppStorage0035
     * @tc.desc      AppStorage key ms_duration_0035 stores 60000 then 60007.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtAppStorage0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'ms_duration_0035';
      const first: number = 60000;
      const second: number = 60007;
      AppStorage.setOrCreate<number>(key, first);
      expect(AppStorage.get<number>(key)).assertEqual(first);
      AppStorage.setOrCreate<number>(key, second);
      expect(AppStorage.get<number>(key)).assertEqual(second);
      expect(key.startsWith('ms_duration_')).assertTrue();
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_APPSTOR_0037
     * @tc.name      testExtAppStorage0036
     * @tc.desc      AppStorage key ms_duration_0036 stores 3599000 then 3599007.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtAppStorage0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'ms_duration_0036';
      const first: number = 3599000;
      const second: number = 3599007;
      AppStorage.setOrCreate<number>(key, first);
      expect(AppStorage.get<number>(key)).assertEqual(first);
      AppStorage.setOrCreate<number>(key, second);
      expect(AppStorage.get<number>(key)).assertEqual(second);
      expect(key.startsWith('ms_duration_')).assertTrue();
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_APPSTOR_0038
     * @tc.name      testExtAppStorage0037
     * @tc.desc      AppStorage key ms_duration_0037 stores -1 then 6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtAppStorage0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'ms_duration_0037';
      const first: number = -1;
      const second: number = 6;
      AppStorage.setOrCreate<number>(key, first);
      expect(AppStorage.get<number>(key)).assertEqual(first);
      AppStorage.setOrCreate<number>(key, second);
      expect(AppStorage.get<number>(key)).assertEqual(second);
      expect(key.startsWith('ms_duration_')).assertTrue();
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_APPSTOR_0039
     * @tc.name      testExtAppStorage0038
     * @tc.desc      AppStorage key ms_duration_0038 stores 42 then 49.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtAppStorage0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'ms_duration_0038';
      const first: number = 42;
      const second: number = 49;
      AppStorage.setOrCreate<number>(key, first);
      expect(AppStorage.get<number>(key)).assertEqual(first);
      AppStorage.setOrCreate<number>(key, second);
      expect(AppStorage.get<number>(key)).assertEqual(second);
      expect(key.startsWith('ms_duration_')).assertTrue();
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_APPSTOR_0040
     * @tc.name      testExtAppStorage0039
     * @tc.desc      AppStorage key ms_duration_0039 stores 999999 then 1000006.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtAppStorage0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'ms_duration_0039';
      const first: number = 999999;
      const second: number = 1000006;
      AppStorage.setOrCreate<number>(key, first);
      expect(AppStorage.get<number>(key)).assertEqual(first);
      AppStorage.setOrCreate<number>(key, second);
      expect(AppStorage.get<number>(key)).assertEqual(second);
      expect(key.startsWith('ms_duration_')).assertTrue();
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_APPSTOR_0041
     * @tc.name      testExtAppStorage0040
     * @tc.desc      AppStorage key ms_duration_0040 stores 0 then 7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtAppStorage0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'ms_duration_0040';
      const first: number = 0;
      const second: number = 7;
      AppStorage.setOrCreate<number>(key, first);
      expect(AppStorage.get<number>(key)).assertEqual(first);
      AppStorage.setOrCreate<number>(key, second);
      expect(AppStorage.get<number>(key)).assertEqual(second);
      expect(key.startsWith('ms_duration_')).assertTrue();
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_APPSTOR_0042
     * @tc.name      testExtAppStorage0041
     * @tc.desc      AppStorage key ms_duration_0041 stores 1 then 8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtAppStorage0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'ms_duration_0041';
      const first: number = 1;
      const second: number = 8;
      AppStorage.setOrCreate<number>(key, first);
      expect(AppStorage.get<number>(key)).assertEqual(first);
      AppStorage.setOrCreate<number>(key, second);
      expect(AppStorage.get<number>(key)).assertEqual(second);
      expect(key.startsWith('ms_duration_')).assertTrue();
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_APPSTOR_0043
     * @tc.name      testExtAppStorage0042
     * @tc.desc      AppStorage key ms_duration_0042 stores 1000 then 1007.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtAppStorage0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'ms_duration_0042';
      const first: number = 1000;
      const second: number = 1007;
      AppStorage.setOrCreate<number>(key, first);
      expect(AppStorage.get<number>(key)).assertEqual(first);
      AppStorage.setOrCreate<number>(key, second);
      expect(AppStorage.get<number>(key)).assertEqual(second);
      expect(key.startsWith('ms_duration_')).assertTrue();
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_APPSTOR_0044
     * @tc.name      testExtAppStorage0043
     * @tc.desc      AppStorage key ms_duration_0043 stores 60000 then 60007.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtAppStorage0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'ms_duration_0043';
      const first: number = 60000;
      const second: number = 60007;
      AppStorage.setOrCreate<number>(key, first);
      expect(AppStorage.get<number>(key)).assertEqual(first);
      AppStorage.setOrCreate<number>(key, second);
      expect(AppStorage.get<number>(key)).assertEqual(second);
      expect(key.startsWith('ms_duration_')).assertTrue();
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_APPSTOR_0045
     * @tc.name      testExtAppStorage0044
     * @tc.desc      AppStorage key ms_duration_0044 stores 3599000 then 3599007.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtAppStorage0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'ms_duration_0044';
      const first: number = 3599000;
      const second: number = 3599007;
      AppStorage.setOrCreate<number>(key, first);
      expect(AppStorage.get<number>(key)).assertEqual(first);
      AppStorage.setOrCreate<number>(key, second);
      expect(AppStorage.get<number>(key)).assertEqual(second);
      expect(key.startsWith('ms_duration_')).assertTrue();
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_APPSTOR_0046
     * @tc.name      testExtAppStorage0045
     * @tc.desc      AppStorage key ms_duration_0045 stores -1 then 6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtAppStorage0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'ms_duration_0045';
      const first: number = -1;
      const second: number = 6;
      AppStorage.setOrCreate<number>(key, first);
      expect(AppStorage.get<number>(key)).assertEqual(first);
      AppStorage.setOrCreate<number>(key, second);
      expect(AppStorage.get<number>(key)).assertEqual(second);
      expect(key.startsWith('ms_duration_')).assertTrue();
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_APPSTOR_0047
     * @tc.name      testExtAppStorage0046
     * @tc.desc      AppStorage key ms_duration_0046 stores 42 then 49.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtAppStorage0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'ms_duration_0046';
      const first: number = 42;
      const second: number = 49;
      AppStorage.setOrCreate<number>(key, first);
      expect(AppStorage.get<number>(key)).assertEqual(first);
      AppStorage.setOrCreate<number>(key, second);
      expect(AppStorage.get<number>(key)).assertEqual(second);
      expect(key.startsWith('ms_duration_')).assertTrue();
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_APPSTOR_0048
     * @tc.name      testExtAppStorage0047
     * @tc.desc      AppStorage key ms_duration_0047 stores 999999 then 1000006.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtAppStorage0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'ms_duration_0047';
      const first: number = 999999;
      const second: number = 1000006;
      AppStorage.setOrCreate<number>(key, first);
      expect(AppStorage.get<number>(key)).assertEqual(first);
      AppStorage.setOrCreate<number>(key, second);
      expect(AppStorage.get<number>(key)).assertEqual(second);
      expect(key.startsWith('ms_duration_')).assertTrue();
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_APPSTOR_0049
     * @tc.name      testExtAppStorage0048
     * @tc.desc      AppStorage key ms_duration_0048 stores 0 then 7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtAppStorage0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'ms_duration_0048';
      const first: number = 0;
      const second: number = 7;
      AppStorage.setOrCreate<number>(key, first);
      expect(AppStorage.get<number>(key)).assertEqual(first);
      AppStorage.setOrCreate<number>(key, second);
      expect(AppStorage.get<number>(key)).assertEqual(second);
      expect(key.startsWith('ms_duration_')).assertTrue();
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_APPSTOR_0050
     * @tc.name      testExtAppStorage0049
     * @tc.desc      AppStorage key ms_duration_0049 stores 1 then 8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtAppStorage0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'ms_duration_0049';
      const first: number = 1;
      const second: number = 8;
      AppStorage.setOrCreate<number>(key, first);
      expect(AppStorage.get<number>(key)).assertEqual(first);
      AppStorage.setOrCreate<number>(key, second);
      expect(AppStorage.get<number>(key)).assertEqual(second);
      expect(key.startsWith('ms_duration_')).assertTrue();
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_APPSTOR_0051
     * @tc.name      testExtAppStorage0050
     * @tc.desc      AppStorage key ms_duration_0050 stores 1000 then 1007.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtAppStorage0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'ms_duration_0050';
      const first: number = 1000;
      const second: number = 1007;
      AppStorage.setOrCreate<number>(key, first);
      expect(AppStorage.get<number>(key)).assertEqual(first);
      AppStorage.setOrCreate<number>(key, second);
      expect(AppStorage.get<number>(key)).assertEqual(second);
      expect(key.startsWith('ms_duration_')).assertTrue();
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_APPSTOR_0052
     * @tc.name      testExtAppStorage0051
     * @tc.desc      AppStorage key ms_duration_0051 stores 60000 then 60007.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtAppStorage0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'ms_duration_0051';
      const first: number = 60000;
      const second: number = 60007;
      AppStorage.setOrCreate<number>(key, first);
      expect(AppStorage.get<number>(key)).assertEqual(first);
      AppStorage.setOrCreate<number>(key, second);
      expect(AppStorage.get<number>(key)).assertEqual(second);
      expect(key.startsWith('ms_duration_')).assertTrue();
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_APPSTOR_0053
     * @tc.name      testExtAppStorage0052
     * @tc.desc      AppStorage key ms_duration_0052 stores 3599000 then 3599007.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtAppStorage0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'ms_duration_0052';
      const first: number = 3599000;
      const second: number = 3599007;
      AppStorage.setOrCreate<number>(key, first);
      expect(AppStorage.get<number>(key)).assertEqual(first);
      AppStorage.setOrCreate<number>(key, second);
      expect(AppStorage.get<number>(key)).assertEqual(second);
      expect(key.startsWith('ms_duration_')).assertTrue();
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_APPSTOR_0054
     * @tc.name      testExtAppStorage0053
     * @tc.desc      AppStorage key ms_duration_0053 stores -1 then 6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtAppStorage0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'ms_duration_0053';
      const first: number = -1;
      const second: number = 6;
      AppStorage.setOrCreate<number>(key, first);
      expect(AppStorage.get<number>(key)).assertEqual(first);
      AppStorage.setOrCreate<number>(key, second);
      expect(AppStorage.get<number>(key)).assertEqual(second);
      expect(key.startsWith('ms_duration_')).assertTrue();
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_APPSTOR_0055
     * @tc.name      testExtAppStorage0054
     * @tc.desc      AppStorage key ms_duration_0054 stores 42 then 49.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtAppStorage0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'ms_duration_0054';
      const first: number = 42;
      const second: number = 49;
      AppStorage.setOrCreate<number>(key, first);
      expect(AppStorage.get<number>(key)).assertEqual(first);
      AppStorage.setOrCreate<number>(key, second);
      expect(AppStorage.get<number>(key)).assertEqual(second);
      expect(key.startsWith('ms_duration_')).assertTrue();
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_APPSTOR_0056
     * @tc.name      testExtAppStorage0055
     * @tc.desc      AppStorage key ms_duration_0055 stores 999999 then 1000006.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtAppStorage0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'ms_duration_0055';
      const first: number = 999999;
      const second: number = 1000006;
      AppStorage.setOrCreate<number>(key, first);
      expect(AppStorage.get<number>(key)).assertEqual(first);
      AppStorage.setOrCreate<number>(key, second);
      expect(AppStorage.get<number>(key)).assertEqual(second);
      expect(key.startsWith('ms_duration_')).assertTrue();
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_APPSTOR_0057
     * @tc.name      testExtAppStorage0056
     * @tc.desc      AppStorage key ms_duration_0056 stores 0 then 7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtAppStorage0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'ms_duration_0056';
      const first: number = 0;
      const second: number = 7;
      AppStorage.setOrCreate<number>(key, first);
      expect(AppStorage.get<number>(key)).assertEqual(first);
      AppStorage.setOrCreate<number>(key, second);
      expect(AppStorage.get<number>(key)).assertEqual(second);
      expect(key.startsWith('ms_duration_')).assertTrue();
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_APPSTOR_0058
     * @tc.name      testExtAppStorage0057
     * @tc.desc      AppStorage key ms_duration_0057 stores 1 then 8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtAppStorage0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'ms_duration_0057';
      const first: number = 1;
      const second: number = 8;
      AppStorage.setOrCreate<number>(key, first);
      expect(AppStorage.get<number>(key)).assertEqual(first);
      AppStorage.setOrCreate<number>(key, second);
      expect(AppStorage.get<number>(key)).assertEqual(second);
      expect(key.startsWith('ms_duration_')).assertTrue();
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_APPSTOR_0059
     * @tc.name      testExtAppStorage0058
     * @tc.desc      AppStorage key ms_duration_0058 stores 1000 then 1007.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtAppStorage0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'ms_duration_0058';
      const first: number = 1000;
      const second: number = 1007;
      AppStorage.setOrCreate<number>(key, first);
      expect(AppStorage.get<number>(key)).assertEqual(first);
      AppStorage.setOrCreate<number>(key, second);
      expect(AppStorage.get<number>(key)).assertEqual(second);
      expect(key.startsWith('ms_duration_')).assertTrue();
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_APPSTOR_0060
     * @tc.name      testExtAppStorage0059
     * @tc.desc      AppStorage key ms_duration_0059 stores 60000 then 60007.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtAppStorage0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'ms_duration_0059';
      const first: number = 60000;
      const second: number = 60007;
      AppStorage.setOrCreate<number>(key, first);
      expect(AppStorage.get<number>(key)).assertEqual(first);
      AppStorage.setOrCreate<number>(key, second);
      expect(AppStorage.get<number>(key)).assertEqual(second);
      expect(key.startsWith('ms_duration_')).assertTrue();
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_APPSTOR_0061
     * @tc.name      testExtAppStorage0060
     * @tc.desc      AppStorage key ms_duration_0060 stores 3599000 then 3599007.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtAppStorage0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'ms_duration_0060';
      const first: number = 3599000;
      const second: number = 3599007;
      AppStorage.setOrCreate<number>(key, first);
      expect(AppStorage.get<number>(key)).assertEqual(first);
      AppStorage.setOrCreate<number>(key, second);
      expect(AppStorage.get<number>(key)).assertEqual(second);
      expect(key.startsWith('ms_duration_')).assertTrue();
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_APPSTOR_0062
     * @tc.name      testExtAppStorage0061
     * @tc.desc      AppStorage key ms_duration_0061 stores -1 then 6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtAppStorage0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'ms_duration_0061';
      const first: number = -1;
      const second: number = 6;
      AppStorage.setOrCreate<number>(key, first);
      expect(AppStorage.get<number>(key)).assertEqual(first);
      AppStorage.setOrCreate<number>(key, second);
      expect(AppStorage.get<number>(key)).assertEqual(second);
      expect(key.startsWith('ms_duration_')).assertTrue();
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_APPSTOR_0063
     * @tc.name      testExtAppStorage0062
     * @tc.desc      AppStorage key ms_duration_0062 stores 42 then 49.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtAppStorage0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'ms_duration_0062';
      const first: number = 42;
      const second: number = 49;
      AppStorage.setOrCreate<number>(key, first);
      expect(AppStorage.get<number>(key)).assertEqual(first);
      AppStorage.setOrCreate<number>(key, second);
      expect(AppStorage.get<number>(key)).assertEqual(second);
      expect(key.startsWith('ms_duration_')).assertTrue();
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_APPSTOR_0064
     * @tc.name      testExtAppStorage0063
     * @tc.desc      AppStorage key ms_duration_0063 stores 999999 then 1000006.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtAppStorage0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'ms_duration_0063';
      const first: number = 999999;
      const second: number = 1000006;
      AppStorage.setOrCreate<number>(key, first);
      expect(AppStorage.get<number>(key)).assertEqual(first);
      AppStorage.setOrCreate<number>(key, second);
      expect(AppStorage.get<number>(key)).assertEqual(second);
      expect(key.startsWith('ms_duration_')).assertTrue();
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_APPSTOR_0065
     * @tc.name      testExtAppStorage0064
     * @tc.desc      AppStorage key ms_duration_0064 stores 0 then 7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtAppStorage0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'ms_duration_0064';
      const first: number = 0;
      const second: number = 7;
      AppStorage.setOrCreate<number>(key, first);
      expect(AppStorage.get<number>(key)).assertEqual(first);
      AppStorage.setOrCreate<number>(key, second);
      expect(AppStorage.get<number>(key)).assertEqual(second);
      expect(key.startsWith('ms_duration_')).assertTrue();
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_APPSTOR_0066
     * @tc.name      testExtAppStorage0065
     * @tc.desc      AppStorage key ms_duration_0065 stores 1 then 8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtAppStorage0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'ms_duration_0065';
      const first: number = 1;
      const second: number = 8;
      AppStorage.setOrCreate<number>(key, first);
      expect(AppStorage.get<number>(key)).assertEqual(first);
      AppStorage.setOrCreate<number>(key, second);
      expect(AppStorage.get<number>(key)).assertEqual(second);
      expect(key.startsWith('ms_duration_')).assertTrue();
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_APPSTOR_0067
     * @tc.name      testExtAppStorage0066
     * @tc.desc      AppStorage key ms_duration_0066 stores 1000 then 1007.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtAppStorage0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'ms_duration_0066';
      const first: number = 1000;
      const second: number = 1007;
      AppStorage.setOrCreate<number>(key, first);
      expect(AppStorage.get<number>(key)).assertEqual(first);
      AppStorage.setOrCreate<number>(key, second);
      expect(AppStorage.get<number>(key)).assertEqual(second);
      expect(key.startsWith('ms_duration_')).assertTrue();
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_APPSTOR_0068
     * @tc.name      testExtAppStorage0067
     * @tc.desc      AppStorage key ms_duration_0067 stores 60000 then 60007.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtAppStorage0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'ms_duration_0067';
      const first: number = 60000;
      const second: number = 60007;
      AppStorage.setOrCreate<number>(key, first);
      expect(AppStorage.get<number>(key)).assertEqual(first);
      AppStorage.setOrCreate<number>(key, second);
      expect(AppStorage.get<number>(key)).assertEqual(second);
      expect(key.startsWith('ms_duration_')).assertTrue();
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_APPSTOR_0069
     * @tc.name      testExtAppStorage0068
     * @tc.desc      AppStorage key ms_duration_0068 stores 3599000 then 3599007.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtAppStorage0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'ms_duration_0068';
      const first: number = 3599000;
      const second: number = 3599007;
      AppStorage.setOrCreate<number>(key, first);
      expect(AppStorage.get<number>(key)).assertEqual(first);
      AppStorage.setOrCreate<number>(key, second);
      expect(AppStorage.get<number>(key)).assertEqual(second);
      expect(key.startsWith('ms_duration_')).assertTrue();
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_APPSTOR_0070
     * @tc.name      testExtAppStorage0069
     * @tc.desc      AppStorage key ms_duration_0069 stores -1 then 6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtAppStorage0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'ms_duration_0069';
      const first: number = -1;
      const second: number = 6;
      AppStorage.setOrCreate<number>(key, first);
      expect(AppStorage.get<number>(key)).assertEqual(first);
      AppStorage.setOrCreate<number>(key, second);
      expect(AppStorage.get<number>(key)).assertEqual(second);
      expect(key.startsWith('ms_duration_')).assertTrue();
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_APPSTOR_0071
     * @tc.name      testExtAppStorage0070
     * @tc.desc      AppStorage key ms_duration_0070 stores 42 then 49.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtAppStorage0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'ms_duration_0070';
      const first: number = 42;
      const second: number = 49;
      AppStorage.setOrCreate<number>(key, first);
      expect(AppStorage.get<number>(key)).assertEqual(first);
      AppStorage.setOrCreate<number>(key, second);
      expect(AppStorage.get<number>(key)).assertEqual(second);
      expect(key.startsWith('ms_duration_')).assertTrue();
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_APPSTOR_0072
     * @tc.name      testExtAppStorage0071
     * @tc.desc      AppStorage key ms_duration_0071 stores 999999 then 1000006.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtAppStorage0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'ms_duration_0071';
      const first: number = 999999;
      const second: number = 1000006;
      AppStorage.setOrCreate<number>(key, first);
      expect(AppStorage.get<number>(key)).assertEqual(first);
      AppStorage.setOrCreate<number>(key, second);
      expect(AppStorage.get<number>(key)).assertEqual(second);
      expect(key.startsWith('ms_duration_')).assertTrue();
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_APPSTOR_0073
     * @tc.name      testExtAppStorage0072
     * @tc.desc      AppStorage key ms_duration_0072 stores 0 then 7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtAppStorage0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'ms_duration_0072';
      const first: number = 0;
      const second: number = 7;
      AppStorage.setOrCreate<number>(key, first);
      expect(AppStorage.get<number>(key)).assertEqual(first);
      AppStorage.setOrCreate<number>(key, second);
      expect(AppStorage.get<number>(key)).assertEqual(second);
      expect(key.startsWith('ms_duration_')).assertTrue();
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_APPSTOR_0074
     * @tc.name      testExtAppStorage0073
     * @tc.desc      AppStorage key ms_duration_0073 stores 1 then 8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtAppStorage0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'ms_duration_0073';
      const first: number = 1;
      const second: number = 8;
      AppStorage.setOrCreate<number>(key, first);
      expect(AppStorage.get<number>(key)).assertEqual(first);
      AppStorage.setOrCreate<number>(key, second);
      expect(AppStorage.get<number>(key)).assertEqual(second);
      expect(key.startsWith('ms_duration_')).assertTrue();
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_APPSTOR_0075
     * @tc.name      testExtAppStorage0074
     * @tc.desc      AppStorage key ms_duration_0074 stores 1000 then 1007.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtAppStorage0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'ms_duration_0074';
      const first: number = 1000;
      const second: number = 1007;
      AppStorage.setOrCreate<number>(key, first);
      expect(AppStorage.get<number>(key)).assertEqual(first);
      AppStorage.setOrCreate<number>(key, second);
      expect(AppStorage.get<number>(key)).assertEqual(second);
      expect(key.startsWith('ms_duration_')).assertTrue();
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_APPSTOR_0076
     * @tc.name      testExtAppStorage0075
     * @tc.desc      AppStorage key ms_duration_0075 stores 60000 then 60007.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtAppStorage0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'ms_duration_0075';
      const first: number = 60000;
      const second: number = 60007;
      AppStorage.setOrCreate<number>(key, first);
      expect(AppStorage.get<number>(key)).assertEqual(first);
      AppStorage.setOrCreate<number>(key, second);
      expect(AppStorage.get<number>(key)).assertEqual(second);
      expect(key.startsWith('ms_duration_')).assertTrue();
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_APPSTOR_0077
     * @tc.name      testExtAppStorage0076
     * @tc.desc      AppStorage key ms_duration_0076 stores 3599000 then 3599007.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtAppStorage0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'ms_duration_0076';
      const first: number = 3599000;
      const second: number = 3599007;
      AppStorage.setOrCreate<number>(key, first);
      expect(AppStorage.get<number>(key)).assertEqual(first);
      AppStorage.setOrCreate<number>(key, second);
      expect(AppStorage.get<number>(key)).assertEqual(second);
      expect(key.startsWith('ms_duration_')).assertTrue();
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_APPSTOR_0078
     * @tc.name      testExtAppStorage0077
     * @tc.desc      AppStorage key ms_duration_0077 stores -1 then 6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtAppStorage0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'ms_duration_0077';
      const first: number = -1;
      const second: number = 6;
      AppStorage.setOrCreate<number>(key, first);
      expect(AppStorage.get<number>(key)).assertEqual(first);
      AppStorage.setOrCreate<number>(key, second);
      expect(AppStorage.get<number>(key)).assertEqual(second);
      expect(key.startsWith('ms_duration_')).assertTrue();
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_APPSTOR_0079
     * @tc.name      testExtAppStorage0078
     * @tc.desc      AppStorage key ms_duration_0078 stores 42 then 49.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtAppStorage0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'ms_duration_0078';
      const first: number = 42;
      const second: number = 49;
      AppStorage.setOrCreate<number>(key, first);
      expect(AppStorage.get<number>(key)).assertEqual(first);
      AppStorage.setOrCreate<number>(key, second);
      expect(AppStorage.get<number>(key)).assertEqual(second);
      expect(key.startsWith('ms_duration_')).assertTrue();
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_APPSTOR_0080
     * @tc.name      testExtAppStorage0079
     * @tc.desc      AppStorage key ms_duration_0079 stores 999999 then 1000006.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtAppStorage0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'ms_duration_0079';
      const first: number = 999999;
      const second: number = 1000006;
      AppStorage.setOrCreate<number>(key, first);
      expect(AppStorage.get<number>(key)).assertEqual(first);
      AppStorage.setOrCreate<number>(key, second);
      expect(AppStorage.get<number>(key)).assertEqual(second);
      expect(key.startsWith('ms_duration_')).assertTrue();
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
  });
}
