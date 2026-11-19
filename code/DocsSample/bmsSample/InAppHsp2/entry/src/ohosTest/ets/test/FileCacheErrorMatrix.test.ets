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
import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { fileIo as fs } from '@kit.CoreFileKit';
import { appContext, errorCode, ERR_NO_SUCH_FILE, writeText, appendText } from './shared/Probe';
import { paceTurn } from './shared/TestPace';
import { logCase } from './shared/TestLog';

export default function cacheErrorMatrixTest() {
  describe('CacheErrorMatrix', () => {
    beforeEach(async () => {
      await paceTurn();
    });
    /**
     * @tc.number    SUB_IHSP_CERR_0001
     * @tc.name      testCacheError0001
     * @tc.desc      Reading missing file 1 reports no such file
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const missing: string = appContext().filesDir + '/err_read_1.txt';
      logCase('testCacheError0001', 'read missing ' + missing);
      const code: number = errorCode(() => {
        fs.readTextSync(missing);
      });
      expect(code).assertEqual(ERR_NO_SUCH_FILE);
      expect(fs.accessSync(missing)).assertFalse();
    });
    /**
     * @tc.number    SUB_IHSP_CERR_0002
     * @tc.name      testCacheError0002
     * @tc.desc      Reading missing file 2 reports no such file
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const missing: string = appContext().filesDir + '/err_read_2.txt';
      logCase('testCacheError0002', 'read missing ' + missing);
      const code: number = errorCode(() => {
        fs.readTextSync(missing);
      });
      expect(code).assertEqual(ERR_NO_SUCH_FILE);
      expect(fs.accessSync(missing)).assertFalse();
    });
    /**
     * @tc.number    SUB_IHSP_CERR_0003
     * @tc.name      testCacheError0003
     * @tc.desc      Reading missing file 3 reports no such file
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const missing: string = appContext().filesDir + '/err_read_3.txt';
      logCase('testCacheError0003', 'read missing ' + missing);
      const code: number = errorCode(() => {
        fs.readTextSync(missing);
      });
      expect(code).assertEqual(ERR_NO_SUCH_FILE);
      expect(fs.accessSync(missing)).assertFalse();
    });
    /**
     * @tc.number    SUB_IHSP_CERR_0004
     * @tc.name      testCacheError0004
     * @tc.desc      Reading missing file 4 reports no such file
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const missing: string = appContext().filesDir + '/err_read_4.txt';
      logCase('testCacheError0004', 'read missing ' + missing);
      const code: number = errorCode(() => {
        fs.readTextSync(missing);
      });
      expect(code).assertEqual(ERR_NO_SUCH_FILE);
      expect(fs.accessSync(missing)).assertFalse();
    });
    /**
     * @tc.number    SUB_IHSP_CERR_0005
     * @tc.name      testCacheError0005
     * @tc.desc      Reading missing file 5 reports no such file
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const missing: string = appContext().filesDir + '/err_read_5.txt';
      logCase('testCacheError0005', 'read missing ' + missing);
      const code: number = errorCode(() => {
        fs.readTextSync(missing);
      });
      expect(code).assertEqual(ERR_NO_SUCH_FILE);
      expect(fs.accessSync(missing)).assertFalse();
    });
    /**
     * @tc.number    SUB_IHSP_CERR_0006
     * @tc.name      testCacheError0006
     * @tc.desc      Reading missing file 6 reports no such file
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const missing: string = appContext().filesDir + '/err_read_6.txt';
      logCase('testCacheError0006', 'read missing ' + missing);
      const code: number = errorCode(() => {
        fs.readTextSync(missing);
      });
      expect(code).assertEqual(ERR_NO_SUCH_FILE);
      expect(fs.accessSync(missing)).assertFalse();
    });
    /**
     * @tc.number    SUB_IHSP_CERR_0007
     * @tc.name      testCacheError0007
     * @tc.desc      Reading missing file 7 reports no such file
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const missing: string = appContext().filesDir + '/err_read_7.txt';
      logCase('testCacheError0007', 'read missing ' + missing);
      const code: number = errorCode(() => {
        fs.readTextSync(missing);
      });
      expect(code).assertEqual(ERR_NO_SUCH_FILE);
      expect(fs.accessSync(missing)).assertFalse();
    });
    /**
     * @tc.number    SUB_IHSP_CERR_0008
     * @tc.name      testCacheError0008
     * @tc.desc      Reading missing file 8 reports no such file
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const missing: string = appContext().filesDir + '/err_read_8.txt';
      logCase('testCacheError0008', 'read missing ' + missing);
      const code: number = errorCode(() => {
        fs.readTextSync(missing);
      });
      expect(code).assertEqual(ERR_NO_SUCH_FILE);
      expect(fs.accessSync(missing)).assertFalse();
    });
    /**
     * @tc.number    SUB_IHSP_CERR_0009
     * @tc.name      testCacheError0009
     * @tc.desc      Reading missing file 9 reports no such file
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const missing: string = appContext().filesDir + '/err_read_9.txt';
      logCase('testCacheError0009', 'read missing ' + missing);
      const code: number = errorCode(() => {
        fs.readTextSync(missing);
      });
      expect(code).assertEqual(ERR_NO_SUCH_FILE);
      expect(fs.accessSync(missing)).assertFalse();
    });
    /**
     * @tc.number    SUB_IHSP_CERR_0010
     * @tc.name      testCacheError0010
     * @tc.desc      Reading missing file 10 reports no such file
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const missing: string = appContext().filesDir + '/err_read_10.txt';
      logCase('testCacheError0010', 'read missing ' + missing);
      const code: number = errorCode(() => {
        fs.readTextSync(missing);
      });
      expect(code).assertEqual(ERR_NO_SUCH_FILE);
      expect(fs.accessSync(missing)).assertFalse();
    });
    /**
     * @tc.number    SUB_IHSP_CERR_0011
     * @tc.name      testCacheError0011
     * @tc.desc      Reading missing file 11 reports no such file
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const missing: string = appContext().filesDir + '/err_read_11.txt';
      logCase('testCacheError0011', 'read missing ' + missing);
      const code: number = errorCode(() => {
        fs.readTextSync(missing);
      });
      expect(code).assertEqual(ERR_NO_SUCH_FILE);
      expect(fs.accessSync(missing)).assertFalse();
    });
    /**
     * @tc.number    SUB_IHSP_CERR_0012
     * @tc.name      testCacheError0012
     * @tc.desc      Reading missing file 12 reports no such file
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const missing: string = appContext().filesDir + '/err_read_12.txt';
      logCase('testCacheError0012', 'read missing ' + missing);
      const code: number = errorCode(() => {
        fs.readTextSync(missing);
      });
      expect(code).assertEqual(ERR_NO_SUCH_FILE);
      expect(fs.accessSync(missing)).assertFalse();
    });
    /**
     * @tc.number    SUB_IHSP_CERR_0013
     * @tc.name      testCacheError0013
     * @tc.desc      Reading missing file 13 reports no such file
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const missing: string = appContext().filesDir + '/err_read_13.txt';
      logCase('testCacheError0013', 'read missing ' + missing);
      const code: number = errorCode(() => {
        fs.readTextSync(missing);
      });
      expect(code).assertEqual(ERR_NO_SUCH_FILE);
      expect(fs.accessSync(missing)).assertFalse();
    });
    /**
     * @tc.number    SUB_IHSP_CERR_0014
     * @tc.name      testCacheError0014
     * @tc.desc      Reading missing file 14 reports no such file
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const missing: string = appContext().filesDir + '/err_read_14.txt';
      logCase('testCacheError0014', 'read missing ' + missing);
      const code: number = errorCode(() => {
        fs.readTextSync(missing);
      });
      expect(code).assertEqual(ERR_NO_SUCH_FILE);
      expect(fs.accessSync(missing)).assertFalse();
    });
    /**
     * @tc.number    SUB_IHSP_CERR_0015
     * @tc.name      testCacheError0015
     * @tc.desc      Reading missing file 15 reports no such file
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const missing: string = appContext().filesDir + '/err_read_15.txt';
      logCase('testCacheError0015', 'read missing ' + missing);
      const code: number = errorCode(() => {
        fs.readTextSync(missing);
      });
      expect(code).assertEqual(ERR_NO_SUCH_FILE);
      expect(fs.accessSync(missing)).assertFalse();
    });
    /**
     * @tc.number    SUB_IHSP_CERR_0016
     * @tc.name      testCacheError0016
     * @tc.desc      Reading missing file 16 reports no such file
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const missing: string = appContext().filesDir + '/err_read_16.txt';
      logCase('testCacheError0016', 'read missing ' + missing);
      const code: number = errorCode(() => {
        fs.readTextSync(missing);
      });
      expect(code).assertEqual(ERR_NO_SUCH_FILE);
      expect(fs.accessSync(missing)).assertFalse();
    });
    /**
     * @tc.number    SUB_IHSP_CERR_0017
     * @tc.name      testCacheError0017
     * @tc.desc      Reading missing file 17 reports no such file
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const missing: string = appContext().filesDir + '/err_read_17.txt';
      logCase('testCacheError0017', 'read missing ' + missing);
      const code: number = errorCode(() => {
        fs.readTextSync(missing);
      });
      expect(code).assertEqual(ERR_NO_SUCH_FILE);
      expect(fs.accessSync(missing)).assertFalse();
    });
    /**
     * @tc.number    SUB_IHSP_CERR_0018
     * @tc.name      testCacheError0018
     * @tc.desc      Reading missing file 18 reports no such file
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const missing: string = appContext().filesDir + '/err_read_18.txt';
      logCase('testCacheError0018', 'read missing ' + missing);
      const code: number = errorCode(() => {
        fs.readTextSync(missing);
      });
      expect(code).assertEqual(ERR_NO_SUCH_FILE);
      expect(fs.accessSync(missing)).assertFalse();
    });
    /**
     * @tc.number    SUB_IHSP_CERR_0019
     * @tc.name      testCacheError0019
     * @tc.desc      Reading missing file 19 reports no such file
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const missing: string = appContext().filesDir + '/err_read_19.txt';
      logCase('testCacheError0019', 'read missing ' + missing);
      const code: number = errorCode(() => {
        fs.readTextSync(missing);
      });
      expect(code).assertEqual(ERR_NO_SUCH_FILE);
      expect(fs.accessSync(missing)).assertFalse();
    });
    /**
     * @tc.number    SUB_IHSP_CERR_0020
     * @tc.name      testCacheError0020
     * @tc.desc      Reading missing file 20 reports no such file
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const missing: string = appContext().filesDir + '/err_read_20.txt';
      logCase('testCacheError0020', 'read missing ' + missing);
      const code: number = errorCode(() => {
        fs.readTextSync(missing);
      });
      expect(code).assertEqual(ERR_NO_SUCH_FILE);
      expect(fs.accessSync(missing)).assertFalse();
    });
    /**
     * @tc.number    SUB_IHSP_CERR_0021
     * @tc.name      testCacheError0021
     * @tc.desc      Reading missing file 21 reports no such file
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const missing: string = appContext().filesDir + '/err_read_21.txt';
      logCase('testCacheError0021', 'read missing ' + missing);
      const code: number = errorCode(() => {
        fs.readTextSync(missing);
      });
      expect(code).assertEqual(ERR_NO_SUCH_FILE);
      expect(fs.accessSync(missing)).assertFalse();
    });
    /**
     * @tc.number    SUB_IHSP_CERR_0022
     * @tc.name      testCacheError0022
     * @tc.desc      Reading missing file 22 reports no such file
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const missing: string = appContext().filesDir + '/err_read_22.txt';
      logCase('testCacheError0022', 'read missing ' + missing);
      const code: number = errorCode(() => {
        fs.readTextSync(missing);
      });
      expect(code).assertEqual(ERR_NO_SUCH_FILE);
      expect(fs.accessSync(missing)).assertFalse();
    });
    /**
     * @tc.number    SUB_IHSP_CERR_0023
     * @tc.name      testCacheError0023
     * @tc.desc      Reading missing file 23 reports no such file
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const missing: string = appContext().filesDir + '/err_read_23.txt';
      logCase('testCacheError0023', 'read missing ' + missing);
      const code: number = errorCode(() => {
        fs.readTextSync(missing);
      });
      expect(code).assertEqual(ERR_NO_SUCH_FILE);
      expect(fs.accessSync(missing)).assertFalse();
    });
    /**
     * @tc.number    SUB_IHSP_CERR_0024
     * @tc.name      testCacheError0024
     * @tc.desc      Reading missing file 24 reports no such file
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const missing: string = appContext().filesDir + '/err_read_24.txt';
      logCase('testCacheError0024', 'read missing ' + missing);
      const code: number = errorCode(() => {
        fs.readTextSync(missing);
      });
      expect(code).assertEqual(ERR_NO_SUCH_FILE);
      expect(fs.accessSync(missing)).assertFalse();
    });
    /**
     * @tc.number    SUB_IHSP_CERR_0025
     * @tc.name      testCacheError0025
     * @tc.desc      Stat on missing file 1 reports no such file
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const missing: string = appContext().cacheDir + '/err_stat_1.txt';
      logCase('testCacheError0025', 'stat missing ' + missing);
      const code: number = errorCode(() => {
        fs.statSync(missing);
      });
      expect(code).assertEqual(ERR_NO_SUCH_FILE);
      expect(fs.accessSync(missing)).assertFalse();
    });
    /**
     * @tc.number    SUB_IHSP_CERR_0026
     * @tc.name      testCacheError0026
     * @tc.desc      Stat on missing file 2 reports no such file
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const missing: string = appContext().cacheDir + '/err_stat_2.txt';
      logCase('testCacheError0026', 'stat missing ' + missing);
      const code: number = errorCode(() => {
        fs.statSync(missing);
      });
      expect(code).assertEqual(ERR_NO_SUCH_FILE);
      expect(fs.accessSync(missing)).assertFalse();
    });
    /**
     * @tc.number    SUB_IHSP_CERR_0027
     * @tc.name      testCacheError0027
     * @tc.desc      Stat on missing file 3 reports no such file
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const missing: string = appContext().cacheDir + '/err_stat_3.txt';
      logCase('testCacheError0027', 'stat missing ' + missing);
      const code: number = errorCode(() => {
        fs.statSync(missing);
      });
      expect(code).assertEqual(ERR_NO_SUCH_FILE);
      expect(fs.accessSync(missing)).assertFalse();
    });
    /**
     * @tc.number    SUB_IHSP_CERR_0028
     * @tc.name      testCacheError0028
     * @tc.desc      Stat on missing file 4 reports no such file
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const missing: string = appContext().cacheDir + '/err_stat_4.txt';
      logCase('testCacheError0028', 'stat missing ' + missing);
      const code: number = errorCode(() => {
        fs.statSync(missing);
      });
      expect(code).assertEqual(ERR_NO_SUCH_FILE);
      expect(fs.accessSync(missing)).assertFalse();
    });
    /**
     * @tc.number    SUB_IHSP_CERR_0029
     * @tc.name      testCacheError0029
     * @tc.desc      Stat on missing file 5 reports no such file
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const missing: string = appContext().cacheDir + '/err_stat_5.txt';
      logCase('testCacheError0029', 'stat missing ' + missing);
      const code: number = errorCode(() => {
        fs.statSync(missing);
      });
      expect(code).assertEqual(ERR_NO_SUCH_FILE);
      expect(fs.accessSync(missing)).assertFalse();
    });
    /**
     * @tc.number    SUB_IHSP_CERR_0030
     * @tc.name      testCacheError0030
     * @tc.desc      Stat on missing file 6 reports no such file
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const missing: string = appContext().cacheDir + '/err_stat_6.txt';
      logCase('testCacheError0030', 'stat missing ' + missing);
      const code: number = errorCode(() => {
        fs.statSync(missing);
      });
      expect(code).assertEqual(ERR_NO_SUCH_FILE);
      expect(fs.accessSync(missing)).assertFalse();
    });
;
  });
}
