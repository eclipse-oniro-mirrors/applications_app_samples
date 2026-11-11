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
import { describe, it as hypiumIt, expect as hypiumExpect, beforeEach, TestType, Size, Level, Assert } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';

const TAG: string = '[Sample_MediaSourceHttpResponse]';
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

function expect(actual: string | number | boolean | Object | null | undefined): Assert {
  hilog.info(DOMAIN, TAG, '%{public}s', 'actual: ' + String(actual));
  return hypiumExpect(actual);
}

export default function mediaSourceHttpResponseTest(): void {
  describe('mediaSourceHttpResponseTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HTTP_0001
     * @tc.name      testExtHttpResponse0000
     * @tc.desc      HTTP 200 with offset 0 length 1 is accepted.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHttpResponse0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const responseCode: number = 200;
      const offset: number = 0;
      const length: number = 1;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(accepted).assertEqual(true);
      expect(end).assertEqual(0);
      expect(header).assertEqual('bytes=0-0');
      expect(header.startsWith('bytes=')).assertTrue();
      if (accepted) {
        expect(responseCode).assertLargerOrEqual(200);
        expect(responseCode).assertLess(207);
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HTTP_0002
     * @tc.name      testExtHttpResponse0001
     * @tc.desc      HTTP 206 with offset 0 length 1 is accepted.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHttpResponse0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const responseCode: number = 206;
      const offset: number = 0;
      const length: number = 1;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(accepted).assertEqual(true);
      expect(end).assertEqual(0);
      expect(header).assertEqual('bytes=0-0');
      expect(header.startsWith('bytes=')).assertTrue();
      if (accepted) {
        expect(responseCode).assertLargerOrEqual(200);
        expect(responseCode).assertLess(207);
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HTTP_0003
     * @tc.name      testExtHttpResponse0002
     * @tc.desc      HTTP 201 with offset 1 length 1 is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHttpResponse0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const responseCode: number = 201;
      const offset: number = 1;
      const length: number = 1;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(accepted).assertEqual(false);
      expect(end).assertEqual(1);
      expect(header).assertEqual('bytes=1-1');
      expect(header.startsWith('bytes=')).assertTrue();
      if (accepted) {
        expect(responseCode).assertLargerOrEqual(200);
        expect(responseCode).assertLess(207);
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HTTP_0004
     * @tc.name      testExtHttpResponse0003
     * @tc.desc      HTTP 204 with offset 1 length 2 is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHttpResponse0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const responseCode: number = 204;
      const offset: number = 1;
      const length: number = 2;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(accepted).assertEqual(false);
      expect(end).assertEqual(2);
      expect(header).assertEqual('bytes=1-2');
      expect(header.startsWith('bytes=')).assertTrue();
      if (accepted) {
        expect(responseCode).assertLargerOrEqual(200);
        expect(responseCode).assertLess(207);
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HTTP_0005
     * @tc.name      testExtHttpResponse0004
     * @tc.desc      HTTP 301 with offset 1023 length 2 is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHttpResponse0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const responseCode: number = 301;
      const offset: number = 1023;
      const length: number = 2;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(accepted).assertEqual(false);
      expect(end).assertEqual(1024);
      expect(header).assertEqual('bytes=1023-1024');
      expect(header.startsWith('bytes=')).assertTrue();
      if (accepted) {
        expect(responseCode).assertLargerOrEqual(200);
        expect(responseCode).assertLess(207);
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HTTP_0006
     * @tc.name      testExtHttpResponse0005
     * @tc.desc      HTTP 404 with offset 1023 length 2 is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHttpResponse0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const responseCode: number = 404;
      const offset: number = 1023;
      const length: number = 2;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(accepted).assertEqual(false);
      expect(end).assertEqual(1024);
      expect(header).assertEqual('bytes=1023-1024');
      expect(header.startsWith('bytes=')).assertTrue();
      if (accepted) {
        expect(responseCode).assertLargerOrEqual(200);
        expect(responseCode).assertLess(207);
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HTTP_0007
     * @tc.name      testExtHttpResponse0006
     * @tc.desc      HTTP 416 with offset 4096 length 512 is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHttpResponse0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const responseCode: number = 416;
      const offset: number = 4096;
      const length: number = 512;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(accepted).assertEqual(false);
      expect(end).assertEqual(4607);
      expect(header).assertEqual('bytes=4096-4607');
      expect(header.startsWith('bytes=')).assertTrue();
      if (accepted) {
        expect(responseCode).assertLargerOrEqual(200);
        expect(responseCode).assertLess(207);
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HTTP_0008
     * @tc.name      testExtHttpResponse0007
     * @tc.desc      HTTP 500 with offset 4096 length 512 is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHttpResponse0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const responseCode: number = 500;
      const offset: number = 4096;
      const length: number = 512;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(accepted).assertEqual(false);
      expect(end).assertEqual(4607);
      expect(header).assertEqual('bytes=4096-4607');
      expect(header.startsWith('bytes=')).assertTrue();
      if (accepted) {
        expect(responseCode).assertLargerOrEqual(200);
        expect(responseCode).assertLess(207);
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HTTP_0009
     * @tc.name      testExtHttpResponse0008
     * @tc.desc      HTTP 200 with offset 65535 length 512 is accepted.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHttpResponse0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const responseCode: number = 200;
      const offset: number = 65535;
      const length: number = 512;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(accepted).assertEqual(true);
      expect(end).assertEqual(66046);
      expect(header).assertEqual('bytes=65535-66046');
      expect(header.startsWith('bytes=')).assertTrue();
      if (accepted) {
        expect(responseCode).assertLargerOrEqual(200);
        expect(responseCode).assertLess(207);
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HTTP_0010
     * @tc.name      testExtHttpResponse0009
     * @tc.desc      HTTP 206 with offset 65535 length 4096 is accepted.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHttpResponse0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const responseCode: number = 206;
      const offset: number = 65535;
      const length: number = 4096;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(accepted).assertEqual(true);
      expect(end).assertEqual(69630);
      expect(header).assertEqual('bytes=65535-69630');
      expect(header.startsWith('bytes=')).assertTrue();
      if (accepted) {
        expect(responseCode).assertLargerOrEqual(200);
        expect(responseCode).assertLess(207);
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HTTP_0011
     * @tc.name      testExtHttpResponse0010
     * @tc.desc      HTTP 201 with offset 1048576 length 4096 is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHttpResponse0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const responseCode: number = 201;
      const offset: number = 1048576;
      const length: number = 4096;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(accepted).assertEqual(false);
      expect(end).assertEqual(1052671);
      expect(header).assertEqual('bytes=1048576-1052671');
      expect(header.startsWith('bytes=')).assertTrue();
      if (accepted) {
        expect(responseCode).assertLargerOrEqual(200);
        expect(responseCode).assertLess(207);
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HTTP_0012
     * @tc.name      testExtHttpResponse0011
     * @tc.desc      HTTP 204 with offset 1048576 length 4096 is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHttpResponse0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const responseCode: number = 204;
      const offset: number = 1048576;
      const length: number = 4096;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(accepted).assertEqual(false);
      expect(end).assertEqual(1052671);
      expect(header).assertEqual('bytes=1048576-1052671');
      expect(header.startsWith('bytes=')).assertTrue();
      if (accepted) {
        expect(responseCode).assertLargerOrEqual(200);
        expect(responseCode).assertLess(207);
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HTTP_0013
     * @tc.name      testExtHttpResponse0012
     * @tc.desc      HTTP 301 with offset 0 length 0 is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHttpResponse0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const responseCode: number = 301;
      const offset: number = 0;
      const length: number = 0;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(accepted).assertEqual(false);
      expect(end).assertEqual(-1);
      expect(header).assertEqual('bytes=0--1');
      expect(header.startsWith('bytes=')).assertTrue();
      if (accepted) {
        expect(responseCode).assertLargerOrEqual(200);
        expect(responseCode).assertLess(207);
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HTTP_0014
     * @tc.name      testExtHttpResponse0013
     * @tc.desc      HTTP 404 with offset 0 length 0 is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHttpResponse0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const responseCode: number = 404;
      const offset: number = 0;
      const length: number = 0;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(accepted).assertEqual(false);
      expect(end).assertEqual(-1);
      expect(header).assertEqual('bytes=0--1');
      expect(header.startsWith('bytes=')).assertTrue();
      if (accepted) {
        expect(responseCode).assertLargerOrEqual(200);
        expect(responseCode).assertLess(207);
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HTTP_0015
     * @tc.name      testExtHttpResponse0014
     * @tc.desc      HTTP 416 with offset 1 length 0 is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHttpResponse0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const responseCode: number = 416;
      const offset: number = 1;
      const length: number = 0;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(accepted).assertEqual(false);
      expect(end).assertEqual(0);
      expect(header).assertEqual('bytes=1-0');
      expect(header.startsWith('bytes=')).assertTrue();
      if (accepted) {
        expect(responseCode).assertLargerOrEqual(200);
        expect(responseCode).assertLess(207);
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HTTP_0016
     * @tc.name      testExtHttpResponse0015
     * @tc.desc      HTTP 500 with offset 1 length 8192 is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHttpResponse0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const responseCode: number = 500;
      const offset: number = 1;
      const length: number = 8192;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(accepted).assertEqual(false);
      expect(end).assertEqual(8192);
      expect(header).assertEqual('bytes=1-8192');
      expect(header.startsWith('bytes=')).assertTrue();
      if (accepted) {
        expect(responseCode).assertLargerOrEqual(200);
        expect(responseCode).assertLess(207);
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HTTP_0017
     * @tc.name      testExtHttpResponse0016
     * @tc.desc      HTTP 200 with offset 1023 length 8192 is accepted.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHttpResponse0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const responseCode: number = 200;
      const offset: number = 1023;
      const length: number = 8192;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(accepted).assertEqual(true);
      expect(end).assertEqual(9214);
      expect(header).assertEqual('bytes=1023-9214');
      expect(header.startsWith('bytes=')).assertTrue();
      if (accepted) {
        expect(responseCode).assertLargerOrEqual(200);
        expect(responseCode).assertLess(207);
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HTTP_0018
     * @tc.name      testExtHttpResponse0017
     * @tc.desc      HTTP 206 with offset 1023 length 8192 is accepted.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHttpResponse0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const responseCode: number = 206;
      const offset: number = 1023;
      const length: number = 8192;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(accepted).assertEqual(true);
      expect(end).assertEqual(9214);
      expect(header).assertEqual('bytes=1023-9214');
      expect(header.startsWith('bytes=')).assertTrue();
      if (accepted) {
        expect(responseCode).assertLargerOrEqual(200);
        expect(responseCode).assertLess(207);
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HTTP_0019
     * @tc.name      testExtHttpResponse0018
     * @tc.desc      HTTP 201 with offset 4096 length 1 is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHttpResponse0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const responseCode: number = 201;
      const offset: number = 4096;
      const length: number = 1;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(accepted).assertEqual(false);
      expect(end).assertEqual(4096);
      expect(header).assertEqual('bytes=4096-4096');
      expect(header.startsWith('bytes=')).assertTrue();
      if (accepted) {
        expect(responseCode).assertLargerOrEqual(200);
        expect(responseCode).assertLess(207);
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HTTP_0020
     * @tc.name      testExtHttpResponse0019
     * @tc.desc      HTTP 204 with offset 4096 length 1 is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHttpResponse0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const responseCode: number = 204;
      const offset: number = 4096;
      const length: number = 1;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(accepted).assertEqual(false);
      expect(end).assertEqual(4096);
      expect(header).assertEqual('bytes=4096-4096');
      expect(header.startsWith('bytes=')).assertTrue();
      if (accepted) {
        expect(responseCode).assertLargerOrEqual(200);
        expect(responseCode).assertLess(207);
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HTTP_0021
     * @tc.name      testExtHttpResponse0020
     * @tc.desc      HTTP 301 with offset 65535 length 1 is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHttpResponse0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const responseCode: number = 301;
      const offset: number = 65535;
      const length: number = 1;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(accepted).assertEqual(false);
      expect(end).assertEqual(65535);
      expect(header).assertEqual('bytes=65535-65535');
      expect(header.startsWith('bytes=')).assertTrue();
      if (accepted) {
        expect(responseCode).assertLargerOrEqual(200);
        expect(responseCode).assertLess(207);
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HTTP_0022
     * @tc.name      testExtHttpResponse0021
     * @tc.desc      HTTP 404 with offset 65535 length 2 is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHttpResponse0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const responseCode: number = 404;
      const offset: number = 65535;
      const length: number = 2;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(accepted).assertEqual(false);
      expect(end).assertEqual(65536);
      expect(header).assertEqual('bytes=65535-65536');
      expect(header.startsWith('bytes=')).assertTrue();
      if (accepted) {
        expect(responseCode).assertLargerOrEqual(200);
        expect(responseCode).assertLess(207);
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HTTP_0023
     * @tc.name      testExtHttpResponse0022
     * @tc.desc      HTTP 416 with offset 1048576 length 2 is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHttpResponse0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const responseCode: number = 416;
      const offset: number = 1048576;
      const length: number = 2;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(accepted).assertEqual(false);
      expect(end).assertEqual(1048577);
      expect(header).assertEqual('bytes=1048576-1048577');
      expect(header.startsWith('bytes=')).assertTrue();
      if (accepted) {
        expect(responseCode).assertLargerOrEqual(200);
        expect(responseCode).assertLess(207);
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HTTP_0024
     * @tc.name      testExtHttpResponse0023
     * @tc.desc      HTTP 500 with offset 1048576 length 2 is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHttpResponse0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const responseCode: number = 500;
      const offset: number = 1048576;
      const length: number = 2;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(accepted).assertEqual(false);
      expect(end).assertEqual(1048577);
      expect(header).assertEqual('bytes=1048576-1048577');
      expect(header.startsWith('bytes=')).assertTrue();
      if (accepted) {
        expect(responseCode).assertLargerOrEqual(200);
        expect(responseCode).assertLess(207);
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HTTP_0025
     * @tc.name      testExtHttpResponse0024
     * @tc.desc      HTTP 200 with offset 0 length 512 is accepted.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHttpResponse0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const responseCode: number = 200;
      const offset: number = 0;
      const length: number = 512;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(accepted).assertEqual(true);
      expect(end).assertEqual(511);
      expect(header).assertEqual('bytes=0-511');
      expect(header.startsWith('bytes=')).assertTrue();
      if (accepted) {
        expect(responseCode).assertLargerOrEqual(200);
        expect(responseCode).assertLess(207);
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HTTP_0026
     * @tc.name      testExtHttpResponse0025
     * @tc.desc      HTTP 206 with offset 0 length 512 is accepted.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHttpResponse0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const responseCode: number = 206;
      const offset: number = 0;
      const length: number = 512;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(accepted).assertEqual(true);
      expect(end).assertEqual(511);
      expect(header).assertEqual('bytes=0-511');
      expect(header.startsWith('bytes=')).assertTrue();
      if (accepted) {
        expect(responseCode).assertLargerOrEqual(200);
        expect(responseCode).assertLess(207);
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HTTP_0027
     * @tc.name      testExtHttpResponse0026
     * @tc.desc      HTTP 201 with offset 1 length 512 is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHttpResponse0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const responseCode: number = 201;
      const offset: number = 1;
      const length: number = 512;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(accepted).assertEqual(false);
      expect(end).assertEqual(512);
      expect(header).assertEqual('bytes=1-512');
      expect(header.startsWith('bytes=')).assertTrue();
      if (accepted) {
        expect(responseCode).assertLargerOrEqual(200);
        expect(responseCode).assertLess(207);
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HTTP_0028
     * @tc.name      testExtHttpResponse0027
     * @tc.desc      HTTP 204 with offset 1 length 4096 is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHttpResponse0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const responseCode: number = 204;
      const offset: number = 1;
      const length: number = 4096;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(accepted).assertEqual(false);
      expect(end).assertEqual(4096);
      expect(header).assertEqual('bytes=1-4096');
      expect(header.startsWith('bytes=')).assertTrue();
      if (accepted) {
        expect(responseCode).assertLargerOrEqual(200);
        expect(responseCode).assertLess(207);
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HTTP_0029
     * @tc.name      testExtHttpResponse0028
     * @tc.desc      HTTP 301 with offset 1023 length 4096 is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHttpResponse0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const responseCode: number = 301;
      const offset: number = 1023;
      const length: number = 4096;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(accepted).assertEqual(false);
      expect(end).assertEqual(5118);
      expect(header).assertEqual('bytes=1023-5118');
      expect(header.startsWith('bytes=')).assertTrue();
      if (accepted) {
        expect(responseCode).assertLargerOrEqual(200);
        expect(responseCode).assertLess(207);
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HTTP_0030
     * @tc.name      testExtHttpResponse0029
     * @tc.desc      HTTP 404 with offset 1023 length 4096 is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHttpResponse0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const responseCode: number = 404;
      const offset: number = 1023;
      const length: number = 4096;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(accepted).assertEqual(false);
      expect(end).assertEqual(5118);
      expect(header).assertEqual('bytes=1023-5118');
      expect(header.startsWith('bytes=')).assertTrue();
      if (accepted) {
        expect(responseCode).assertLargerOrEqual(200);
        expect(responseCode).assertLess(207);
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HTTP_0031
     * @tc.name      testExtHttpResponse0030
     * @tc.desc      HTTP 416 with offset 4096 length 0 is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHttpResponse0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const responseCode: number = 416;
      const offset: number = 4096;
      const length: number = 0;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(accepted).assertEqual(false);
      expect(end).assertEqual(4095);
      expect(header).assertEqual('bytes=4096-4095');
      expect(header.startsWith('bytes=')).assertTrue();
      if (accepted) {
        expect(responseCode).assertLargerOrEqual(200);
        expect(responseCode).assertLess(207);
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HTTP_0032
     * @tc.name      testExtHttpResponse0031
     * @tc.desc      HTTP 500 with offset 4096 length 0 is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHttpResponse0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const responseCode: number = 500;
      const offset: number = 4096;
      const length: number = 0;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(accepted).assertEqual(false);
      expect(end).assertEqual(4095);
      expect(header).assertEqual('bytes=4096-4095');
      expect(header.startsWith('bytes=')).assertTrue();
      if (accepted) {
        expect(responseCode).assertLargerOrEqual(200);
        expect(responseCode).assertLess(207);
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HTTP_0033
     * @tc.name      testExtHttpResponse0032
     * @tc.desc      HTTP 200 with offset 65535 length 0 is accepted.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHttpResponse0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const responseCode: number = 200;
      const offset: number = 65535;
      const length: number = 0;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(accepted).assertEqual(true);
      expect(end).assertEqual(65534);
      expect(header).assertEqual('bytes=65535-65534');
      expect(header.startsWith('bytes=')).assertTrue();
      if (accepted) {
        expect(responseCode).assertLargerOrEqual(200);
        expect(responseCode).assertLess(207);
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HTTP_0034
     * @tc.name      testExtHttpResponse0033
     * @tc.desc      HTTP 206 with offset 65535 length 8192 is accepted.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHttpResponse0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const responseCode: number = 206;
      const offset: number = 65535;
      const length: number = 8192;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(accepted).assertEqual(true);
      expect(end).assertEqual(73726);
      expect(header).assertEqual('bytes=65535-73726');
      expect(header.startsWith('bytes=')).assertTrue();
      if (accepted) {
        expect(responseCode).assertLargerOrEqual(200);
        expect(responseCode).assertLess(207);
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HTTP_0035
     * @tc.name      testExtHttpResponse0034
     * @tc.desc      HTTP 201 with offset 1048576 length 8192 is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHttpResponse0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const responseCode: number = 201;
      const offset: number = 1048576;
      const length: number = 8192;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(accepted).assertEqual(false);
      expect(end).assertEqual(1056767);
      expect(header).assertEqual('bytes=1048576-1056767');
      expect(header.startsWith('bytes=')).assertTrue();
      if (accepted) {
        expect(responseCode).assertLargerOrEqual(200);
        expect(responseCode).assertLess(207);
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HTTP_0036
     * @tc.name      testExtHttpResponse0035
     * @tc.desc      HTTP 204 with offset 1048576 length 8192 is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHttpResponse0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const responseCode: number = 204;
      const offset: number = 1048576;
      const length: number = 8192;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(accepted).assertEqual(false);
      expect(end).assertEqual(1056767);
      expect(header).assertEqual('bytes=1048576-1056767');
      expect(header.startsWith('bytes=')).assertTrue();
      if (accepted) {
        expect(responseCode).assertLargerOrEqual(200);
        expect(responseCode).assertLess(207);
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HTTP_0037
     * @tc.name      testExtHttpResponse0036
     * @tc.desc      HTTP 301 with offset 0 length 1 is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHttpResponse0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const responseCode: number = 301;
      const offset: number = 0;
      const length: number = 1;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(accepted).assertEqual(false);
      expect(end).assertEqual(0);
      expect(header).assertEqual('bytes=0-0');
      expect(header.startsWith('bytes=')).assertTrue();
      if (accepted) {
        expect(responseCode).assertLargerOrEqual(200);
        expect(responseCode).assertLess(207);
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HTTP_0038
     * @tc.name      testExtHttpResponse0037
     * @tc.desc      HTTP 404 with offset 0 length 1 is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHttpResponse0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const responseCode: number = 404;
      const offset: number = 0;
      const length: number = 1;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(accepted).assertEqual(false);
      expect(end).assertEqual(0);
      expect(header).assertEqual('bytes=0-0');
      expect(header.startsWith('bytes=')).assertTrue();
      if (accepted) {
        expect(responseCode).assertLargerOrEqual(200);
        expect(responseCode).assertLess(207);
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HTTP_0039
     * @tc.name      testExtHttpResponse0038
     * @tc.desc      HTTP 416 with offset 1 length 1 is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHttpResponse0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const responseCode: number = 416;
      const offset: number = 1;
      const length: number = 1;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(accepted).assertEqual(false);
      expect(end).assertEqual(1);
      expect(header).assertEqual('bytes=1-1');
      expect(header.startsWith('bytes=')).assertTrue();
      if (accepted) {
        expect(responseCode).assertLargerOrEqual(200);
        expect(responseCode).assertLess(207);
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HTTP_0040
     * @tc.name      testExtHttpResponse0039
     * @tc.desc      HTTP 500 with offset 1 length 2 is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHttpResponse0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const responseCode: number = 500;
      const offset: number = 1;
      const length: number = 2;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(accepted).assertEqual(false);
      expect(end).assertEqual(2);
      expect(header).assertEqual('bytes=1-2');
      expect(header.startsWith('bytes=')).assertTrue();
      if (accepted) {
        expect(responseCode).assertLargerOrEqual(200);
        expect(responseCode).assertLess(207);
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HTTP_0041
     * @tc.name      testExtHttpResponse0040
     * @tc.desc      HTTP 200 with offset 1023 length 2 is accepted.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHttpResponse0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const responseCode: number = 200;
      const offset: number = 1023;
      const length: number = 2;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(accepted).assertEqual(true);
      expect(end).assertEqual(1024);
      expect(header).assertEqual('bytes=1023-1024');
      expect(header.startsWith('bytes=')).assertTrue();
      if (accepted) {
        expect(responseCode).assertLargerOrEqual(200);
        expect(responseCode).assertLess(207);
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HTTP_0042
     * @tc.name      testExtHttpResponse0041
     * @tc.desc      HTTP 206 with offset 1023 length 2 is accepted.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHttpResponse0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const responseCode: number = 206;
      const offset: number = 1023;
      const length: number = 2;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(accepted).assertEqual(true);
      expect(end).assertEqual(1024);
      expect(header).assertEqual('bytes=1023-1024');
      expect(header.startsWith('bytes=')).assertTrue();
      if (accepted) {
        expect(responseCode).assertLargerOrEqual(200);
        expect(responseCode).assertLess(207);
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HTTP_0043
     * @tc.name      testExtHttpResponse0042
     * @tc.desc      HTTP 201 with offset 4096 length 512 is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHttpResponse0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const responseCode: number = 201;
      const offset: number = 4096;
      const length: number = 512;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(accepted).assertEqual(false);
      expect(end).assertEqual(4607);
      expect(header).assertEqual('bytes=4096-4607');
      expect(header.startsWith('bytes=')).assertTrue();
      if (accepted) {
        expect(responseCode).assertLargerOrEqual(200);
        expect(responseCode).assertLess(207);
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HTTP_0044
     * @tc.name      testExtHttpResponse0043
     * @tc.desc      HTTP 204 with offset 4096 length 512 is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHttpResponse0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const responseCode: number = 204;
      const offset: number = 4096;
      const length: number = 512;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(accepted).assertEqual(false);
      expect(end).assertEqual(4607);
      expect(header).assertEqual('bytes=4096-4607');
      expect(header.startsWith('bytes=')).assertTrue();
      if (accepted) {
        expect(responseCode).assertLargerOrEqual(200);
        expect(responseCode).assertLess(207);
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HTTP_0045
     * @tc.name      testExtHttpResponse0044
     * @tc.desc      HTTP 301 with offset 65535 length 512 is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHttpResponse0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const responseCode: number = 301;
      const offset: number = 65535;
      const length: number = 512;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(accepted).assertEqual(false);
      expect(end).assertEqual(66046);
      expect(header).assertEqual('bytes=65535-66046');
      expect(header.startsWith('bytes=')).assertTrue();
      if (accepted) {
        expect(responseCode).assertLargerOrEqual(200);
        expect(responseCode).assertLess(207);
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HTTP_0046
     * @tc.name      testExtHttpResponse0045
     * @tc.desc      HTTP 404 with offset 65535 length 4096 is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHttpResponse0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const responseCode: number = 404;
      const offset: number = 65535;
      const length: number = 4096;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(accepted).assertEqual(false);
      expect(end).assertEqual(69630);
      expect(header).assertEqual('bytes=65535-69630');
      expect(header.startsWith('bytes=')).assertTrue();
      if (accepted) {
        expect(responseCode).assertLargerOrEqual(200);
        expect(responseCode).assertLess(207);
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HTTP_0047
     * @tc.name      testExtHttpResponse0046
     * @tc.desc      HTTP 416 with offset 1048576 length 4096 is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHttpResponse0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const responseCode: number = 416;
      const offset: number = 1048576;
      const length: number = 4096;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(accepted).assertEqual(false);
      expect(end).assertEqual(1052671);
      expect(header).assertEqual('bytes=1048576-1052671');
      expect(header.startsWith('bytes=')).assertTrue();
      if (accepted) {
        expect(responseCode).assertLargerOrEqual(200);
        expect(responseCode).assertLess(207);
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HTTP_0048
     * @tc.name      testExtHttpResponse0047
     * @tc.desc      HTTP 500 with offset 1048576 length 4096 is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHttpResponse0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const responseCode: number = 500;
      const offset: number = 1048576;
      const length: number = 4096;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(accepted).assertEqual(false);
      expect(end).assertEqual(1052671);
      expect(header).assertEqual('bytes=1048576-1052671');
      expect(header.startsWith('bytes=')).assertTrue();
      if (accepted) {
        expect(responseCode).assertLargerOrEqual(200);
        expect(responseCode).assertLess(207);
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HTTP_0049
     * @tc.name      testExtHttpResponse0048
     * @tc.desc      HTTP 200 with offset 0 length 0 is accepted.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHttpResponse0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const responseCode: number = 200;
      const offset: number = 0;
      const length: number = 0;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(accepted).assertEqual(true);
      expect(end).assertEqual(-1);
      expect(header).assertEqual('bytes=0--1');
      expect(header.startsWith('bytes=')).assertTrue();
      if (accepted) {
        expect(responseCode).assertLargerOrEqual(200);
        expect(responseCode).assertLess(207);
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HTTP_0050
     * @tc.name      testExtHttpResponse0049
     * @tc.desc      HTTP 206 with offset 0 length 0 is accepted.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHttpResponse0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const responseCode: number = 206;
      const offset: number = 0;
      const length: number = 0;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(accepted).assertEqual(true);
      expect(end).assertEqual(-1);
      expect(header).assertEqual('bytes=0--1');
      expect(header.startsWith('bytes=')).assertTrue();
      if (accepted) {
        expect(responseCode).assertLargerOrEqual(200);
        expect(responseCode).assertLess(207);
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HTTP_0051
     * @tc.name      testExtHttpResponse0050
     * @tc.desc      HTTP 201 with offset 1 length 0 is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHttpResponse0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const responseCode: number = 201;
      const offset: number = 1;
      const length: number = 0;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(accepted).assertEqual(false);
      expect(end).assertEqual(0);
      expect(header).assertEqual('bytes=1-0');
      expect(header.startsWith('bytes=')).assertTrue();
      if (accepted) {
        expect(responseCode).assertLargerOrEqual(200);
        expect(responseCode).assertLess(207);
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HTTP_0052
     * @tc.name      testExtHttpResponse0051
     * @tc.desc      HTTP 204 with offset 1 length 8192 is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHttpResponse0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const responseCode: number = 204;
      const offset: number = 1;
      const length: number = 8192;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(accepted).assertEqual(false);
      expect(end).assertEqual(8192);
      expect(header).assertEqual('bytes=1-8192');
      expect(header.startsWith('bytes=')).assertTrue();
      if (accepted) {
        expect(responseCode).assertLargerOrEqual(200);
        expect(responseCode).assertLess(207);
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HTTP_0053
     * @tc.name      testExtHttpResponse0052
     * @tc.desc      HTTP 301 with offset 1023 length 8192 is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHttpResponse0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const responseCode: number = 301;
      const offset: number = 1023;
      const length: number = 8192;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(accepted).assertEqual(false);
      expect(end).assertEqual(9214);
      expect(header).assertEqual('bytes=1023-9214');
      expect(header.startsWith('bytes=')).assertTrue();
      if (accepted) {
        expect(responseCode).assertLargerOrEqual(200);
        expect(responseCode).assertLess(207);
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HTTP_0054
     * @tc.name      testExtHttpResponse0053
     * @tc.desc      HTTP 404 with offset 1023 length 8192 is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHttpResponse0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const responseCode: number = 404;
      const offset: number = 1023;
      const length: number = 8192;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(accepted).assertEqual(false);
      expect(end).assertEqual(9214);
      expect(header).assertEqual('bytes=1023-9214');
      expect(header.startsWith('bytes=')).assertTrue();
      if (accepted) {
        expect(responseCode).assertLargerOrEqual(200);
        expect(responseCode).assertLess(207);
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HTTP_0055
     * @tc.name      testExtHttpResponse0054
     * @tc.desc      HTTP 416 with offset 4096 length 1 is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHttpResponse0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const responseCode: number = 416;
      const offset: number = 4096;
      const length: number = 1;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(accepted).assertEqual(false);
      expect(end).assertEqual(4096);
      expect(header).assertEqual('bytes=4096-4096');
      expect(header.startsWith('bytes=')).assertTrue();
      if (accepted) {
        expect(responseCode).assertLargerOrEqual(200);
        expect(responseCode).assertLess(207);
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HTTP_0056
     * @tc.name      testExtHttpResponse0055
     * @tc.desc      HTTP 500 with offset 4096 length 1 is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHttpResponse0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const responseCode: number = 500;
      const offset: number = 4096;
      const length: number = 1;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(accepted).assertEqual(false);
      expect(end).assertEqual(4096);
      expect(header).assertEqual('bytes=4096-4096');
      expect(header.startsWith('bytes=')).assertTrue();
      if (accepted) {
        expect(responseCode).assertLargerOrEqual(200);
        expect(responseCode).assertLess(207);
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HTTP_0057
     * @tc.name      testExtHttpResponse0056
     * @tc.desc      HTTP 200 with offset 65535 length 1 is accepted.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHttpResponse0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const responseCode: number = 200;
      const offset: number = 65535;
      const length: number = 1;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(accepted).assertEqual(true);
      expect(end).assertEqual(65535);
      expect(header).assertEqual('bytes=65535-65535');
      expect(header.startsWith('bytes=')).assertTrue();
      if (accepted) {
        expect(responseCode).assertLargerOrEqual(200);
        expect(responseCode).assertLess(207);
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HTTP_0058
     * @tc.name      testExtHttpResponse0057
     * @tc.desc      HTTP 206 with offset 65535 length 2 is accepted.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHttpResponse0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const responseCode: number = 206;
      const offset: number = 65535;
      const length: number = 2;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(accepted).assertEqual(true);
      expect(end).assertEqual(65536);
      expect(header).assertEqual('bytes=65535-65536');
      expect(header.startsWith('bytes=')).assertTrue();
      if (accepted) {
        expect(responseCode).assertLargerOrEqual(200);
        expect(responseCode).assertLess(207);
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HTTP_0059
     * @tc.name      testExtHttpResponse0058
     * @tc.desc      HTTP 201 with offset 1048576 length 2 is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHttpResponse0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const responseCode: number = 201;
      const offset: number = 1048576;
      const length: number = 2;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(accepted).assertEqual(false);
      expect(end).assertEqual(1048577);
      expect(header).assertEqual('bytes=1048576-1048577');
      expect(header.startsWith('bytes=')).assertTrue();
      if (accepted) {
        expect(responseCode).assertLargerOrEqual(200);
        expect(responseCode).assertLess(207);
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HTTP_0060
     * @tc.name      testExtHttpResponse0059
     * @tc.desc      HTTP 204 with offset 1048576 length 2 is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHttpResponse0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const responseCode: number = 204;
      const offset: number = 1048576;
      const length: number = 2;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(accepted).assertEqual(false);
      expect(end).assertEqual(1048577);
      expect(header).assertEqual('bytes=1048576-1048577');
      expect(header.startsWith('bytes=')).assertTrue();
      if (accepted) {
        expect(responseCode).assertLargerOrEqual(200);
        expect(responseCode).assertLess(207);
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HTTP_0061
     * @tc.name      testExtHttpResponse0060
     * @tc.desc      HTTP 301 with offset 0 length 512 is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHttpResponse0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const responseCode: number = 301;
      const offset: number = 0;
      const length: number = 512;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(accepted).assertEqual(false);
      expect(end).assertEqual(511);
      expect(header).assertEqual('bytes=0-511');
      expect(header.startsWith('bytes=')).assertTrue();
      if (accepted) {
        expect(responseCode).assertLargerOrEqual(200);
        expect(responseCode).assertLess(207);
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HTTP_0062
     * @tc.name      testExtHttpResponse0061
     * @tc.desc      HTTP 404 with offset 0 length 512 is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHttpResponse0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const responseCode: number = 404;
      const offset: number = 0;
      const length: number = 512;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(accepted).assertEqual(false);
      expect(end).assertEqual(511);
      expect(header).assertEqual('bytes=0-511');
      expect(header.startsWith('bytes=')).assertTrue();
      if (accepted) {
        expect(responseCode).assertLargerOrEqual(200);
        expect(responseCode).assertLess(207);
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HTTP_0063
     * @tc.name      testExtHttpResponse0062
     * @tc.desc      HTTP 416 with offset 1 length 512 is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHttpResponse0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const responseCode: number = 416;
      const offset: number = 1;
      const length: number = 512;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(accepted).assertEqual(false);
      expect(end).assertEqual(512);
      expect(header).assertEqual('bytes=1-512');
      expect(header.startsWith('bytes=')).assertTrue();
      if (accepted) {
        expect(responseCode).assertLargerOrEqual(200);
        expect(responseCode).assertLess(207);
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HTTP_0064
     * @tc.name      testExtHttpResponse0063
     * @tc.desc      HTTP 500 with offset 1 length 4096 is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHttpResponse0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const responseCode: number = 500;
      const offset: number = 1;
      const length: number = 4096;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(accepted).assertEqual(false);
      expect(end).assertEqual(4096);
      expect(header).assertEqual('bytes=1-4096');
      expect(header.startsWith('bytes=')).assertTrue();
      if (accepted) {
        expect(responseCode).assertLargerOrEqual(200);
        expect(responseCode).assertLess(207);
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HTTP_0065
     * @tc.name      testExtHttpResponse0064
     * @tc.desc      HTTP 200 with offset 1023 length 4096 is accepted.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHttpResponse0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const responseCode: number = 200;
      const offset: number = 1023;
      const length: number = 4096;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(accepted).assertEqual(true);
      expect(end).assertEqual(5118);
      expect(header).assertEqual('bytes=1023-5118');
      expect(header.startsWith('bytes=')).assertTrue();
      if (accepted) {
        expect(responseCode).assertLargerOrEqual(200);
        expect(responseCode).assertLess(207);
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HTTP_0066
     * @tc.name      testExtHttpResponse0065
     * @tc.desc      HTTP 206 with offset 1023 length 4096 is accepted.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHttpResponse0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const responseCode: number = 206;
      const offset: number = 1023;
      const length: number = 4096;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(accepted).assertEqual(true);
      expect(end).assertEqual(5118);
      expect(header).assertEqual('bytes=1023-5118');
      expect(header.startsWith('bytes=')).assertTrue();
      if (accepted) {
        expect(responseCode).assertLargerOrEqual(200);
        expect(responseCode).assertLess(207);
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HTTP_0067
     * @tc.name      testExtHttpResponse0066
     * @tc.desc      HTTP 201 with offset 4096 length 0 is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHttpResponse0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const responseCode: number = 201;
      const offset: number = 4096;
      const length: number = 0;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(accepted).assertEqual(false);
      expect(end).assertEqual(4095);
      expect(header).assertEqual('bytes=4096-4095');
      expect(header.startsWith('bytes=')).assertTrue();
      if (accepted) {
        expect(responseCode).assertLargerOrEqual(200);
        expect(responseCode).assertLess(207);
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HTTP_0068
     * @tc.name      testExtHttpResponse0067
     * @tc.desc      HTTP 204 with offset 4096 length 0 is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHttpResponse0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const responseCode: number = 204;
      const offset: number = 4096;
      const length: number = 0;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(accepted).assertEqual(false);
      expect(end).assertEqual(4095);
      expect(header).assertEqual('bytes=4096-4095');
      expect(header.startsWith('bytes=')).assertTrue();
      if (accepted) {
        expect(responseCode).assertLargerOrEqual(200);
        expect(responseCode).assertLess(207);
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HTTP_0069
     * @tc.name      testExtHttpResponse0068
     * @tc.desc      HTTP 301 with offset 65535 length 0 is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHttpResponse0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const responseCode: number = 301;
      const offset: number = 65535;
      const length: number = 0;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(accepted).assertEqual(false);
      expect(end).assertEqual(65534);
      expect(header).assertEqual('bytes=65535-65534');
      expect(header.startsWith('bytes=')).assertTrue();
      if (accepted) {
        expect(responseCode).assertLargerOrEqual(200);
        expect(responseCode).assertLess(207);
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HTTP_0070
     * @tc.name      testExtHttpResponse0069
     * @tc.desc      HTTP 404 with offset 65535 length 8192 is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHttpResponse0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const responseCode: number = 404;
      const offset: number = 65535;
      const length: number = 8192;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(accepted).assertEqual(false);
      expect(end).assertEqual(73726);
      expect(header).assertEqual('bytes=65535-73726');
      expect(header.startsWith('bytes=')).assertTrue();
      if (accepted) {
        expect(responseCode).assertLargerOrEqual(200);
        expect(responseCode).assertLess(207);
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HTTP_0071
     * @tc.name      testExtHttpResponse0070
     * @tc.desc      HTTP 416 with offset 1048576 length 8192 is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHttpResponse0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const responseCode: number = 416;
      const offset: number = 1048576;
      const length: number = 8192;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(accepted).assertEqual(false);
      expect(end).assertEqual(1056767);
      expect(header).assertEqual('bytes=1048576-1056767');
      expect(header.startsWith('bytes=')).assertTrue();
      if (accepted) {
        expect(responseCode).assertLargerOrEqual(200);
        expect(responseCode).assertLess(207);
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HTTP_0072
     * @tc.name      testExtHttpResponse0071
     * @tc.desc      HTTP 500 with offset 1048576 length 8192 is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHttpResponse0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const responseCode: number = 500;
      const offset: number = 1048576;
      const length: number = 8192;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(accepted).assertEqual(false);
      expect(end).assertEqual(1056767);
      expect(header).assertEqual('bytes=1048576-1056767');
      expect(header.startsWith('bytes=')).assertTrue();
      if (accepted) {
        expect(responseCode).assertLargerOrEqual(200);
        expect(responseCode).assertLess(207);
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HTTP_0073
     * @tc.name      testExtHttpResponse0072
     * @tc.desc      HTTP 200 with offset 0 length 1 is accepted.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHttpResponse0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const responseCode: number = 200;
      const offset: number = 0;
      const length: number = 1;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(accepted).assertEqual(true);
      expect(end).assertEqual(0);
      expect(header).assertEqual('bytes=0-0');
      expect(header.startsWith('bytes=')).assertTrue();
      if (accepted) {
        expect(responseCode).assertLargerOrEqual(200);
        expect(responseCode).assertLess(207);
      }
    })
  });
}
