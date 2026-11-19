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
import { bundleManager } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_UniversalLink]';

export default function canOpenLinkMoreMatrixTest(): void {
  describe('UniversalLinkCanOpenLinkMoreMatrixTest', () => {
    /**
     * @tc.number    SUB_UNIVERSAL_LINK_CAN_OPEN_LINK_MORE_0001
     * @tc.name      testCanOpenLinkMoreMatrix0001
     * @tc.desc      canOpenLink("https://www.example.com") 因未声明 querySchemes 抛 17700056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testCanOpenLinkMoreMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMoreMatrix0001 begin');
      const link: string = 'https://www.example.com';
      let code: number = 0;
      try {
        bundleManager.canOpenLink(link);
      } catch (error) {
        code = (error as BusinessError).code;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 code=${code}`);
      expect(code).assertEqual(17700056);
      const actual2: boolean = link === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertFalse();
      const actual3: string = typeof link;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMoreMatrix0001 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_CAN_OPEN_LINK_MORE_0002
     * @tc.name      testCanOpenLinkMoreMatrix0002
     * @tc.desc      canOpenLink("http://example.com") 因未声明 querySchemes 抛 17700056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testCanOpenLinkMoreMatrix0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMoreMatrix0002 begin');
      const link: string = 'http://example.com';
      let code: number = 0;
      try {
        bundleManager.canOpenLink(link);
      } catch (error) {
        code = (error as BusinessError).code;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 code=${code}`);
      expect(code).assertEqual(17700056);
      const actual2: boolean = link === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertFalse();
      const actual3: string = typeof link;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMoreMatrix0002 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_CAN_OPEN_LINK_MORE_0003
     * @tc.name      testCanOpenLinkMoreMatrix0003
     * @tc.desc      canOpenLink("https://example.com/path") 因未声明 querySchemes 抛 17700056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testCanOpenLinkMoreMatrix0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMoreMatrix0003 begin');
      const link: string = 'https://example.com/path';
      let code: number = 0;
      try {
        bundleManager.canOpenLink(link);
      } catch (error) {
        code = (error as BusinessError).code;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 code=${code}`);
      expect(code).assertEqual(17700056);
      const actual2: boolean = link === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertFalse();
      const actual3: string = typeof link;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMoreMatrix0003 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_CAN_OPEN_LINK_MORE_0004
     * @tc.name      testCanOpenLinkMoreMatrix0004
     * @tc.desc      canOpenLink("https://example.com/path/to/page") 因未声明 querySchemes 抛 17700056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testCanOpenLinkMoreMatrix0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMoreMatrix0004 begin');
      const link: string = 'https://example.com/path/to/page';
      let code: number = 0;
      try {
        bundleManager.canOpenLink(link);
      } catch (error) {
        code = (error as BusinessError).code;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 code=${code}`);
      expect(code).assertEqual(17700056);
      const actual2: boolean = link === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertFalse();
      const actual3: string = typeof link;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMoreMatrix0004 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_CAN_OPEN_LINK_MORE_0005
     * @tc.name      testCanOpenLinkMoreMatrix0005
     * @tc.desc      canOpenLink("https://example.com/path?key=value") 因未声明 querySchemes 抛 17700056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testCanOpenLinkMoreMatrix0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMoreMatrix0005 begin');
      const link: string = 'https://example.com/path?key=value';
      let code: number = 0;
      try {
        bundleManager.canOpenLink(link);
      } catch (error) {
        code = (error as BusinessError).code;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 code=${code}`);
      expect(code).assertEqual(17700056);
      const actual2: boolean = link === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertFalse();
      const actual3: string = typeof link;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMoreMatrix0005 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_CAN_OPEN_LINK_MORE_0006
     * @tc.name      testCanOpenLinkMoreMatrix0006
     * @tc.desc      canOpenLink("https://example.com/path?key=value&foo=bar") 因未声明 querySchemes 抛 17700056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testCanOpenLinkMoreMatrix0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMoreMatrix0006 begin');
      const link: string = 'https://example.com/path?key=value&foo=bar';
      let code: number = 0;
      try {
        bundleManager.canOpenLink(link);
      } catch (error) {
        code = (error as BusinessError).code;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 code=${code}`);
      expect(code).assertEqual(17700056);
      const actual2: boolean = link === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertFalse();
      const actual3: string = typeof link;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMoreMatrix0006 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_CAN_OPEN_LINK_MORE_0007
     * @tc.name      testCanOpenLinkMoreMatrix0007
     * @tc.desc      canOpenLink("https://example.com/path#section") 因未声明 querySchemes 抛 17700056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testCanOpenLinkMoreMatrix0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMoreMatrix0007 begin');
      const link: string = 'https://example.com/path#section';
      let code: number = 0;
      try {
        bundleManager.canOpenLink(link);
      } catch (error) {
        code = (error as BusinessError).code;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 code=${code}`);
      expect(code).assertEqual(17700056);
      const actual2: boolean = link === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertFalse();
      const actual3: string = typeof link;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMoreMatrix0007 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_CAN_OPEN_LINK_MORE_0008
     * @tc.name      testCanOpenLinkMoreMatrix0008
     * @tc.desc      canOpenLink("https://example.com/path?key=value#section") 因未声明 querySchemes 抛 17700056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testCanOpenLinkMoreMatrix0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMoreMatrix0008 begin');
      const link: string = 'https://example.com/path?key=value#section';
      let code: number = 0;
      try {
        bundleManager.canOpenLink(link);
      } catch (error) {
        code = (error as BusinessError).code;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 code=${code}`);
      expect(code).assertEqual(17700056);
      const actual2: boolean = link === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertFalse();
      const actual3: string = typeof link;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMoreMatrix0008 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_CAN_OPEN_LINK_MORE_0009
     * @tc.name      testCanOpenLinkMoreMatrix0009
     * @tc.desc      canOpenLink("https://user:pass@example.com") 因未声明 querySchemes 抛 17700056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testCanOpenLinkMoreMatrix0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMoreMatrix0009 begin');
      const link: string = 'https://user:pass@example.com';
      let code: number = 0;
      try {
        bundleManager.canOpenLink(link);
      } catch (error) {
        code = (error as BusinessError).code;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 code=${code}`);
      expect(code).assertEqual(17700056);
      const actual2: boolean = link === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertFalse();
      const actual3: string = typeof link;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMoreMatrix0009 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_CAN_OPEN_LINK_MORE_0010
     * @tc.name      testCanOpenLinkMoreMatrix0010
     * @tc.desc      canOpenLink("https://example.com:443") 因未声明 querySchemes 抛 17700056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testCanOpenLinkMoreMatrix0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMoreMatrix0010 begin');
      const link: string = 'https://example.com:443';
      let code: number = 0;
      try {
        bundleManager.canOpenLink(link);
      } catch (error) {
        code = (error as BusinessError).code;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 code=${code}`);
      expect(code).assertEqual(17700056);
      const actual2: boolean = link === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertFalse();
      const actual3: string = typeof link;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMoreMatrix0010 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_CAN_OPEN_LINK_MORE_0011
     * @tc.name      testCanOpenLinkMoreMatrix0011
     * @tc.desc      canOpenLink("https://example.com:8080") 因未声明 querySchemes 抛 17700056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testCanOpenLinkMoreMatrix0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMoreMatrix0011 begin');
      const link: string = 'https://example.com:8080';
      let code: number = 0;
      try {
        bundleManager.canOpenLink(link);
      } catch (error) {
        code = (error as BusinessError).code;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 code=${code}`);
      expect(code).assertEqual(17700056);
      const actual2: boolean = link === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertFalse();
      const actual3: string = typeof link;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMoreMatrix0011 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_CAN_OPEN_LINK_MORE_0012
     * @tc.name      testCanOpenLinkMoreMatrix0012
     * @tc.desc      canOpenLink("http://192.168.1.1") 因未声明 querySchemes 抛 17700056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testCanOpenLinkMoreMatrix0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMoreMatrix0012 begin');
      const link: string = 'http://192.168.1.1';
      let code: number = 0;
      try {
        bundleManager.canOpenLink(link);
      } catch (error) {
        code = (error as BusinessError).code;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 code=${code}`);
      expect(code).assertEqual(17700056);
      const actual2: boolean = link === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertFalse();
      const actual3: string = typeof link;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMoreMatrix0012 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_CAN_OPEN_LINK_MORE_0013
     * @tc.name      testCanOpenLinkMoreMatrix0013
     * @tc.desc      canOpenLink("http://192.168.1.1:8080/path") 因未声明 querySchemes 抛 17700056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testCanOpenLinkMoreMatrix0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMoreMatrix0013 begin');
      const link: string = 'http://192.168.1.1:8080/path';
      let code: number = 0;
      try {
        bundleManager.canOpenLink(link);
      } catch (error) {
        code = (error as BusinessError).code;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 code=${code}`);
      expect(code).assertEqual(17700056);
      const actual2: boolean = link === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertFalse();
      const actual3: string = typeof link;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMoreMatrix0013 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_CAN_OPEN_LINK_MORE_0014
     * @tc.name      testCanOpenLinkMoreMatrix0014
     * @tc.desc      canOpenLink("http://[::1]") 因未声明 querySchemes 抛 17700056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testCanOpenLinkMoreMatrix0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMoreMatrix0014 begin');
      const link: string = 'http://[::1]';
      let code: number = 0;
      try {
        bundleManager.canOpenLink(link);
      } catch (error) {
        code = (error as BusinessError).code;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 code=${code}`);
      expect(code).assertEqual(17700056);
      const actual2: boolean = link === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertFalse();
      const actual3: string = typeof link;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMoreMatrix0014 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_CAN_OPEN_LINK_MORE_0015
     * @tc.name      testCanOpenLinkMoreMatrix0015
     * @tc.desc      canOpenLink("ftp://ftp.example.com/file") 因未声明 querySchemes 抛 17700056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testCanOpenLinkMoreMatrix0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMoreMatrix0015 begin');
      const link: string = 'ftp://ftp.example.com/file';
      let code: number = 0;
      try {
        bundleManager.canOpenLink(link);
      } catch (error) {
        code = (error as BusinessError).code;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 code=${code}`);
      expect(code).assertEqual(17700056);
      const actual2: boolean = link === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertFalse();
      const actual3: string = typeof link;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMoreMatrix0015 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_CAN_OPEN_LINK_MORE_0016
     * @tc.name      testCanOpenLinkMoreMatrix0016
     * @tc.desc      canOpenLink("sftp://example.com/file") 因未声明 querySchemes 抛 17700056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCanOpenLinkMoreMatrix0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMoreMatrix0016 begin');
      const link: string = 'sftp://example.com/file';
      let code: number = 0;
      try {
        bundleManager.canOpenLink(link);
      } catch (error) {
        code = (error as BusinessError).code;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 code=${code}`);
      expect(code).assertEqual(17700056);
      const actual2: boolean = link === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertFalse();
      const actual3: string = typeof link;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMoreMatrix0016 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_CAN_OPEN_LINK_MORE_0017
     * @tc.name      testCanOpenLinkMoreMatrix0017
     * @tc.desc      canOpenLink("file:///data/storage/el2/base/files/test.txt") 因未声明 querySchemes 抛 17700056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCanOpenLinkMoreMatrix0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMoreMatrix0017 begin');
      const link: string = 'file:///data/storage/el2/base/files/test.txt';
      let code: number = 0;
      try {
        bundleManager.canOpenLink(link);
      } catch (error) {
        code = (error as BusinessError).code;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 code=${code}`);
      expect(code).assertEqual(17700056);
      const actual2: boolean = link === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertFalse();
      const actual3: string = typeof link;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMoreMatrix0017 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_CAN_OPEN_LINK_MORE_0018
     * @tc.name      testCanOpenLinkMoreMatrix0018
     * @tc.desc      canOpenLink("content://com.example.provider/item/1") 因未声明 querySchemes 抛 17700056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCanOpenLinkMoreMatrix0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMoreMatrix0018 begin');
      const link: string = 'content://com.example.provider/item/1';
      let code: number = 0;
      try {
        bundleManager.canOpenLink(link);
      } catch (error) {
        code = (error as BusinessError).code;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 code=${code}`);
      expect(code).assertEqual(17700056);
      const actual2: boolean = link === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertFalse();
      const actual3: string = typeof link;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMoreMatrix0018 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_CAN_OPEN_LINK_MORE_0019
     * @tc.name      testCanOpenLinkMoreMatrix0019
     * @tc.desc      canOpenLink("myscheme://action") 因未声明 querySchemes 抛 17700056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCanOpenLinkMoreMatrix0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMoreMatrix0019 begin');
      const link: string = 'myscheme://action';
      let code: number = 0;
      try {
        bundleManager.canOpenLink(link);
      } catch (error) {
        code = (error as BusinessError).code;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 code=${code}`);
      expect(code).assertEqual(17700056);
      const actual2: boolean = link === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertFalse();
      const actual3: string = typeof link;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMoreMatrix0019 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_CAN_OPEN_LINK_MORE_0020
     * @tc.name      testCanOpenLinkMoreMatrix0020
     * @tc.desc      canOpenLink("openharmony://app") 因未声明 querySchemes 抛 17700056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCanOpenLinkMoreMatrix0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMoreMatrix0020 begin');
      const link: string = 'openharmony://app';
      let code: number = 0;
      try {
        bundleManager.canOpenLink(link);
      } catch (error) {
        code = (error as BusinessError).code;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 code=${code}`);
      expect(code).assertEqual(17700056);
      const actual2: boolean = link === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertFalse();
      const actual3: string = typeof link;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMoreMatrix0020 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_CAN_OPEN_LINK_MORE_0021
     * @tc.name      testCanOpenLinkMoreMatrix0021
     * @tc.desc      canOpenLink("ability://com.example.app/EntryAbility") 因未声明 querySchemes 抛 17700056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCanOpenLinkMoreMatrix0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMoreMatrix0021 begin');
      const link: string = 'ability://com.example.app/EntryAbility';
      let code: number = 0;
      try {
        bundleManager.canOpenLink(link);
      } catch (error) {
        code = (error as BusinessError).code;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 code=${code}`);
      expect(code).assertEqual(17700056);
      const actual2: boolean = link === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertFalse();
      const actual3: string = typeof link;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMoreMatrix0021 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_CAN_OPEN_LINK_MORE_0022
     * @tc.name      testCanOpenLinkMoreMatrix0022
     * @tc.desc      canOpenLink("https://example.com/%20space") 因未声明 querySchemes 抛 17700056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCanOpenLinkMoreMatrix0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMoreMatrix0022 begin');
      const link: string = 'https://example.com/%20space';
      let code: number = 0;
      try {
        bundleManager.canOpenLink(link);
      } catch (error) {
        code = (error as BusinessError).code;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 code=${code}`);
      expect(code).assertEqual(17700056);
      const actual2: boolean = link === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertFalse();
      const actual3: string = typeof link;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMoreMatrix0022 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_CAN_OPEN_LINK_MORE_0023
     * @tc.name      testCanOpenLinkMoreMatrix0023
     * @tc.desc      canOpenLink("https://example.com/?q=%E4%B8%AD%E6%96%87") 因未声明 querySchemes 抛 17700056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCanOpenLinkMoreMatrix0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMoreMatrix0023 begin');
      const link: string = 'https://example.com/?q=%E4%B8%AD%E6%96%87';
      let code: number = 0;
      try {
        bundleManager.canOpenLink(link);
      } catch (error) {
        code = (error as BusinessError).code;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 code=${code}`);
      expect(code).assertEqual(17700056);
      const actual2: boolean = link === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertFalse();
      const actual3: string = typeof link;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMoreMatrix0023 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_CAN_OPEN_LINK_MORE_0024
     * @tc.name      testCanOpenLinkMoreMatrix0024
     * @tc.desc      canOpenLink("https://example.com/中文路径") 因未声明 querySchemes 抛 17700056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCanOpenLinkMoreMatrix0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMoreMatrix0024 begin');
      const link: string = 'https://example.com/中文路径';
      let code: number = 0;
      try {
        bundleManager.canOpenLink(link);
      } catch (error) {
        code = (error as BusinessError).code;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 code=${code}`);
      expect(code).assertEqual(17700056);
      const actual2: boolean = link === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertFalse();
      const actual3: string = typeof link;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMoreMatrix0024 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_CAN_OPEN_LINK_MORE_0025
     * @tc.name      testCanOpenLinkMoreMatrix0025
     * @tc.desc      canOpenLink("http://example.com:0") 因未声明 querySchemes 抛 17700056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCanOpenLinkMoreMatrix0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMoreMatrix0025 begin');
      const link: string = 'http://example.com:0';
      let code: number = 0;
      try {
        bundleManager.canOpenLink(link);
      } catch (error) {
        code = (error as BusinessError).code;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 code=${code}`);
      expect(code).assertEqual(17700056);
      const actual2: boolean = link === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertFalse();
      const actual3: string = typeof link;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMoreMatrix0025 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_CAN_OPEN_LINK_MORE_0026
     * @tc.name      testCanOpenLinkMoreMatrix0026
     * @tc.desc      canOpenLink("http://example.com:-1") 因未声明 querySchemes 抛 17700056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCanOpenLinkMoreMatrix0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMoreMatrix0026 begin');
      const link: string = 'http://example.com:-1';
      let code: number = 0;
      try {
        bundleManager.canOpenLink(link);
      } catch (error) {
        code = (error as BusinessError).code;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 code=${code}`);
      expect(code).assertEqual(17700056);
      const actual2: boolean = link === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertFalse();
      const actual3: string = typeof link;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMoreMatrix0026 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_CAN_OPEN_LINK_MORE_0027
     * @tc.name      testCanOpenLinkMoreMatrix0027
     * @tc.desc      canOpenLink("https://example.com/%5Cbackslash") 因未声明 querySchemes 抛 17700056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCanOpenLinkMoreMatrix0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMoreMatrix0027 begin');
      const link: string = 'https://example.com/%5Cbackslash';
      let code: number = 0;
      try {
        bundleManager.canOpenLink(link);
      } catch (error) {
        code = (error as BusinessError).code;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 code=${code}`);
      expect(code).assertEqual(17700056);
      const actual2: boolean = link === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertFalse();
      const actual3: string = typeof link;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMoreMatrix0027 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_CAN_OPEN_LINK_MORE_0028
     * @tc.name      testCanOpenLinkMoreMatrix0028
     * @tc.desc      canOpenLink("scheme://") 因未声明 querySchemes 抛 17700056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCanOpenLinkMoreMatrix0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMoreMatrix0028 begin');
      const link: string = 'scheme://';
      let code: number = 0;
      try {
        bundleManager.canOpenLink(link);
      } catch (error) {
        code = (error as BusinessError).code;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 code=${code}`);
      expect(code).assertEqual(17700056);
      const actual2: boolean = link === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertFalse();
      const actual3: string = typeof link;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMoreMatrix0028 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_CAN_OPEN_LINK_MORE_0029
     * @tc.name      testCanOpenLinkMoreMatrix0029
     * @tc.desc      canOpenLink("://missing-scheme") 因未声明 querySchemes 抛 17700056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCanOpenLinkMoreMatrix0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMoreMatrix0029 begin');
      const link: string = '://missing-scheme';
      let code: number = 0;
      try {
        bundleManager.canOpenLink(link);
      } catch (error) {
        code = (error as BusinessError).code;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 code=${code}`);
      expect(code).assertEqual(17700056);
      const actual2: boolean = link === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertFalse();
      const actual3: string = typeof link;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMoreMatrix0029 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_CAN_OPEN_LINK_MORE_0030
     * @tc.name      testCanOpenLinkMoreMatrix0030
     * @tc.desc      canOpenLink("http://") 因未声明 querySchemes 抛 17700056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCanOpenLinkMoreMatrix0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMoreMatrix0030 begin');
      const link: string = 'http://';
      let code: number = 0;
      try {
        bundleManager.canOpenLink(link);
      } catch (error) {
        code = (error as BusinessError).code;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 code=${code}`);
      expect(code).assertEqual(17700056);
      const actual2: boolean = link === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertFalse();
      const actual3: string = typeof link;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMoreMatrix0030 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_CAN_OPEN_LINK_MORE_0031
     * @tc.name      testCanOpenLinkMoreMatrix0031
     * @tc.desc      canOpenLink("https://") 因未声明 querySchemes 抛 17700056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCanOpenLinkMoreMatrix0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMoreMatrix0031 begin');
      const link: string = 'https://';
      let code: number = 0;
      try {
        bundleManager.canOpenLink(link);
      } catch (error) {
        code = (error as BusinessError).code;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 code=${code}`);
      expect(code).assertEqual(17700056);
      const actual2: boolean = link === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertFalse();
      const actual3: string = typeof link;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMoreMatrix0031 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_CAN_OPEN_LINK_MORE_0032
     * @tc.name      testCanOpenLinkMoreMatrix0032
     * @tc.desc      canOpenLink("http:// example.com") 因未声明 querySchemes 抛 17700056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCanOpenLinkMoreMatrix0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMoreMatrix0032 begin');
      const link: string = 'http:// example.com';
      let code: number = 0;
      try {
        bundleManager.canOpenLink(link);
      } catch (error) {
        code = (error as BusinessError).code;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 code=${code}`);
      expect(code).assertEqual(17700056);
      const actual2: boolean = link === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertFalse();
      const actual3: string = typeof link;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMoreMatrix0032 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_CAN_OPEN_LINK_MORE_0033
     * @tc.name      testCanOpenLinkMoreMatrix0033
     * @tc.desc      canOpenLink("http://example .com") 因未声明 querySchemes 抛 17700056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCanOpenLinkMoreMatrix0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMoreMatrix0033 begin');
      const link: string = 'http://example .com';
      let code: number = 0;
      try {
        bundleManager.canOpenLink(link);
      } catch (error) {
        code = (error as BusinessError).code;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 code=${code}`);
      expect(code).assertEqual(17700056);
      const actual2: boolean = link === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertFalse();
      const actual3: string = typeof link;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMoreMatrix0033 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_CAN_OPEN_LINK_MORE_0034
     * @tc.name      testCanOpenLinkMoreMatrix0034
     * @tc.desc      canOpenLink("http://..com") 因未声明 querySchemes 抛 17700056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCanOpenLinkMoreMatrix0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMoreMatrix0034 begin');
      const link: string = 'http://..com';
      let code: number = 0;
      try {
        bundleManager.canOpenLink(link);
      } catch (error) {
        code = (error as BusinessError).code;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 code=${code}`);
      expect(code).assertEqual(17700056);
      const actual2: boolean = link === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertFalse();
      const actual3: string = typeof link;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMoreMatrix0034 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_CAN_OPEN_LINK_MORE_0035
     * @tc.name      testCanOpenLinkMoreMatrix0035
     * @tc.desc      canOpenLink("http://example..com") 因未声明 querySchemes 抛 17700056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCanOpenLinkMoreMatrix0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMoreMatrix0035 begin');
      const link: string = 'http://example..com';
      let code: number = 0;
      try {
        bundleManager.canOpenLink(link);
      } catch (error) {
        code = (error as BusinessError).code;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 code=${code}`);
      expect(code).assertEqual(17700056);
      const actual2: boolean = link === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertFalse();
      const actual3: string = typeof link;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMoreMatrix0035 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_CAN_OPEN_LINK_MORE_0036
     * @tc.name      testCanOpenLinkMoreMatrix0036
     * @tc.desc      canOpenLink("http://-example.com") 因未声明 querySchemes 抛 17700056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCanOpenLinkMoreMatrix0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMoreMatrix0036 begin');
      const link: string = 'http://-example.com';
      let code: number = 0;
      try {
        bundleManager.canOpenLink(link);
      } catch (error) {
        code = (error as BusinessError).code;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 code=${code}`);
      expect(code).assertEqual(17700056);
      const actual2: boolean = link === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertFalse();
      const actual3: string = typeof link;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMoreMatrix0036 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_CAN_OPEN_LINK_MORE_0037
     * @tc.name      testCanOpenLinkMoreMatrix0037
     * @tc.desc      canOpenLink("http://example-.com") 因未声明 querySchemes 抛 17700056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCanOpenLinkMoreMatrix0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMoreMatrix0037 begin');
      const link: string = 'http://example-.com';
      let code: number = 0;
      try {
        bundleManager.canOpenLink(link);
      } catch (error) {
        code = (error as BusinessError).code;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 code=${code}`);
      expect(code).assertEqual(17700056);
      const actual2: boolean = link === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertFalse();
      const actual3: string = typeof link;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMoreMatrix0037 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_CAN_OPEN_LINK_MORE_0038
     * @tc.name      testCanOpenLinkMoreMatrix0038
     * @tc.desc      canOpenLink("http://example.com.") 因未声明 querySchemes 抛 17700056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCanOpenLinkMoreMatrix0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMoreMatrix0038 begin');
      const link: string = 'http://example.com.';
      let code: number = 0;
      try {
        bundleManager.canOpenLink(link);
      } catch (error) {
        code = (error as BusinessError).code;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 code=${code}`);
      expect(code).assertEqual(17700056);
      const actual2: boolean = link === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertFalse();
      const actual3: string = typeof link;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMoreMatrix0038 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_CAN_OPEN_LINK_MORE_0039
     * @tc.name      testCanOpenLinkMoreMatrix0039
     * @tc.desc      canOpenLink("http://.example.com") 因未声明 querySchemes 抛 17700056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCanOpenLinkMoreMatrix0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMoreMatrix0039 begin');
      const link: string = 'http://.example.com';
      let code: number = 0;
      try {
        bundleManager.canOpenLink(link);
      } catch (error) {
        code = (error as BusinessError).code;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 code=${code}`);
      expect(code).assertEqual(17700056);
      const actual2: boolean = link === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertFalse();
      const actual3: string = typeof link;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMoreMatrix0039 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_CAN_OPEN_LINK_MORE_0040
     * @tc.name      testCanOpenLinkMoreMatrix0040
     * @tc.desc      canOpenLink("http://example") 因未声明 querySchemes 抛 17700056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCanOpenLinkMoreMatrix0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMoreMatrix0040 begin');
      const link: string = 'http://example';
      let code: number = 0;
      try {
        bundleManager.canOpenLink(link);
      } catch (error) {
        code = (error as BusinessError).code;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 code=${code}`);
      expect(code).assertEqual(17700056);
      const actual2: boolean = link === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertFalse();
      const actual3: string = typeof link;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMoreMatrix0040 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_CAN_OPEN_LINK_MORE_0041
     * @tc.name      testCanOpenLinkMoreMatrix0041
     * @tc.desc      canOpenLink("http://12345") 因未声明 querySchemes 抛 17700056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCanOpenLinkMoreMatrix0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMoreMatrix0041 begin');
      const link: string = 'http://12345';
      let code: number = 0;
      try {
        bundleManager.canOpenLink(link);
      } catch (error) {
        code = (error as BusinessError).code;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 code=${code}`);
      expect(code).assertEqual(17700056);
      const actual2: boolean = link === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertFalse();
      const actual3: string = typeof link;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMoreMatrix0041 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_CAN_OPEN_LINK_MORE_0042
     * @tc.name      testCanOpenLinkMoreMatrix0042
     * @tc.desc      canOpenLink("notalink") 因未声明 querySchemes 抛 17700056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCanOpenLinkMoreMatrix0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMoreMatrix0042 begin');
      const link: string = 'notalink';
      let code: number = 0;
      try {
        bundleManager.canOpenLink(link);
      } catch (error) {
        code = (error as BusinessError).code;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 code=${code}`);
      expect(code).assertEqual(17700056);
      const actual2: boolean = link === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertFalse();
      const actual3: string = typeof link;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMoreMatrix0042 end');
    })
  })
}
