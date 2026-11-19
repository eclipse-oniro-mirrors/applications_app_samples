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

export default function canOpenLinkMatrixTest(): void {
  describe('UniversalLinkCanOpenLinkMatrixTest', () => {
    /**
     * @tc.number    SUB_UNIVERSAL_LINK_CAN_OPEN_LINK_0001
     * @tc.name      testCanOpenLinkMatrix0001
     * @tc.desc      canOpenLink("http://docs.openharmony.cn") 因未声明 querySchemes 抛 17700056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testCanOpenLinkMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMatrix0001 begin');
      const link: string = 'http://docs.openharmony.cn';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMatrix0001 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_CAN_OPEN_LINK_0002
     * @tc.name      testCanOpenLinkMatrix0002
     * @tc.desc      canOpenLink("https://docs.openharmony.cn") 因未声明 querySchemes 抛 17700056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testCanOpenLinkMatrix0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMatrix0002 begin');
      const link: string = 'https://docs.openharmony.cn';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMatrix0002 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_CAN_OPEN_LINK_0003
     * @tc.name      testCanOpenLinkMatrix0003
     * @tc.desc      canOpenLink("ftp://docs.openharmony.cn") 因未声明 querySchemes 抛 17700056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testCanOpenLinkMatrix0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMatrix0003 begin');
      const link: string = 'ftp://docs.openharmony.cn';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMatrix0003 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_CAN_OPEN_LINK_0004
     * @tc.name      testCanOpenLinkMatrix0004
     * @tc.desc      canOpenLink("myapp://open") 因未声明 querySchemes 抛 17700056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testCanOpenLinkMatrix0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMatrix0004 begin');
      const link: string = 'myapp://open';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMatrix0004 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_CAN_OPEN_LINK_0005
     * @tc.name      testCanOpenLinkMatrix0005
     * @tc.desc      canOpenLink("abilityruntime://open") 因未声明 querySchemes 抛 17700056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testCanOpenLinkMatrix0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMatrix0005 begin');
      const link: string = 'abilityruntime://open';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMatrix0005 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_CAN_OPEN_LINK_0006
     * @tc.name      testCanOpenLinkMatrix0006
     * @tc.desc      canOpenLink("http://www.openharmony.cn") 因未声明 querySchemes 抛 17700056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testCanOpenLinkMatrix0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMatrix0006 begin');
      const link: string = 'http://www.openharmony.cn';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMatrix0006 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_CAN_OPEN_LINK_0007
     * @tc.name      testCanOpenLinkMatrix0007
     * @tc.desc      canOpenLink("http://sub.docs.openharmony.cn") 因未声明 querySchemes 抛 17700056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testCanOpenLinkMatrix0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMatrix0007 begin');
      const link: string = 'http://sub.docs.openharmony.cn';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMatrix0007 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_CAN_OPEN_LINK_0008
     * @tc.name      testCanOpenLinkMatrix0008
     * @tc.desc      canOpenLink("http://docs.openharmony.com") 因未声明 querySchemes 抛 17700056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testCanOpenLinkMatrix0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMatrix0008 begin');
      const link: string = 'http://docs.openharmony.com';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMatrix0008 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_CAN_OPEN_LINK_0009
     * @tc.name      testCanOpenLinkMatrix0009
     * @tc.desc      canOpenLink("file:///data/storage/el2/base/files") 因未声明 querySchemes 抛 17700056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testCanOpenLinkMatrix0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMatrix0009 begin');
      const link: string = 'file:///data/storage/el2/base/files';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMatrix0009 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_CAN_OPEN_LINK_0010
     * @tc.name      testCanOpenLinkMatrix0010
     * @tc.desc      canOpenLink("mailto:a@docs.openharmony.cn") 因未声明 querySchemes 抛 17700056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testCanOpenLinkMatrix0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMatrix0010 begin');
      const link: string = 'mailto:a@docs.openharmony.cn';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMatrix0010 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_CAN_OPEN_LINK_0011
     * @tc.name      testCanOpenLinkMatrix0011
     * @tc.desc      canOpenLink("tel:10086") 因未声明 querySchemes 抛 17700056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCanOpenLinkMatrix0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMatrix0011 begin');
      const link: string = 'tel:10086';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMatrix0011 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_CAN_OPEN_LINK_0012
     * @tc.name      testCanOpenLinkMatrix0012
     * @tc.desc      canOpenLink("ws://docs.openharmony.cn") 因未声明 querySchemes 抛 17700056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCanOpenLinkMatrix0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMatrix0012 begin');
      const link: string = 'ws://docs.openharmony.cn';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMatrix0012 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_CAN_OPEN_LINK_0013
     * @tc.name      testCanOpenLinkMatrix0013
     * @tc.desc      canOpenLink("wss://docs.openharmony.cn") 因未声明 querySchemes 抛 17700056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCanOpenLinkMatrix0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMatrix0013 begin');
      const link: string = 'wss://docs.openharmony.cn';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMatrix0013 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_CAN_OPEN_LINK_0014
     * @tc.name      testCanOpenLinkMatrix0014
     * @tc.desc      canOpenLink("http://127.0.0.1") 因未声明 querySchemes 抛 17700056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCanOpenLinkMatrix0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMatrix0014 begin');
      const link: string = 'http://127.0.0.1';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMatrix0014 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_CAN_OPEN_LINK_0015
     * @tc.name      testCanOpenLinkMatrix0015
     * @tc.desc      canOpenLink("http://localhost") 因未声明 querySchemes 抛 17700056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCanOpenLinkMatrix0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMatrix0015 begin');
      const link: string = 'http://localhost';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMatrix0015 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_CAN_OPEN_LINK_0016
     * @tc.name      testCanOpenLinkMatrix0016
     * @tc.desc      canOpenLink("http://docs.openharmony.cn:8080") 因未声明 querySchemes 抛 17700056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCanOpenLinkMatrix0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMatrix0016 begin');
      const link: string = 'http://docs.openharmony.cn:8080';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMatrix0016 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_CAN_OPEN_LINK_0017
     * @tc.name      testCanOpenLinkMatrix0017
     * @tc.desc      canOpenLink("http://docs.openharmony.cn/pages") 因未声明 querySchemes 抛 17700056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCanOpenLinkMatrix0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMatrix0017 begin');
      const link: string = 'http://docs.openharmony.cn/pages';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMatrix0017 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_CAN_OPEN_LINK_0018
     * @tc.name      testCanOpenLinkMatrix0018
     * @tc.desc      canOpenLink("http://docs.openharmony.cn/pages/1") 因未声明 querySchemes 抛 17700056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCanOpenLinkMatrix0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMatrix0018 begin');
      const link: string = 'http://docs.openharmony.cn/pages/1';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMatrix0018 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_CAN_OPEN_LINK_0019
     * @tc.name      testCanOpenLinkMatrix0019
     * @tc.desc      canOpenLink("https://docs.openharmony.cn/pages?q=1") 因未声明 querySchemes 抛 17700056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCanOpenLinkMatrix0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMatrix0019 begin');
      const link: string = 'https://docs.openharmony.cn/pages?q=1';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMatrix0019 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_CAN_OPEN_LINK_0020
     * @tc.name      testCanOpenLinkMatrix0020
     * @tc.desc      canOpenLink("http://docs.openharmony.cn#top") 因未声明 querySchemes 抛 17700056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCanOpenLinkMatrix0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMatrix0020 begin');
      const link: string = 'http://docs.openharmony.cn#top';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMatrix0020 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_CAN_OPEN_LINK_0021
     * @tc.name      testCanOpenLinkMatrix0021
     * @tc.desc      canOpenLink("HTTP://DOCS.OPENHARMONY.CN") 因未声明 querySchemes 抛 17700056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCanOpenLinkMatrix0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMatrix0021 begin');
      const link: string = 'HTTP://DOCS.OPENHARMONY.CN';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMatrix0021 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_CAN_OPEN_LINK_0022
     * @tc.name      testCanOpenLinkMatrix0022
     * @tc.desc      canOpenLink("Http://Docs.Openharmony.Cn") 因未声明 querySchemes 抛 17700056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCanOpenLinkMatrix0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMatrix0022 begin');
      const link: string = 'Http://Docs.Openharmony.Cn';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMatrix0022 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_CAN_OPEN_LINK_0023
     * @tc.name      testCanOpenLinkMatrix0023
     * @tc.desc      canOpenLink("http://docs.openharmony.cn.") 因未声明 querySchemes 抛 17700056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCanOpenLinkMatrix0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMatrix0023 begin');
      const link: string = 'http://docs.openharmony.cn.';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMatrix0023 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_CAN_OPEN_LINK_0024
     * @tc.name      testCanOpenLinkMatrix0024
     * @tc.desc      canOpenLink("http://docs.openharmony") 因未声明 querySchemes 抛 17700056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCanOpenLinkMatrix0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMatrix0024 begin');
      const link: string = 'http://docs.openharmony';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMatrix0024 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_CAN_OPEN_LINK_0025
     * @tc.name      testCanOpenLinkMatrix0025
     * @tc.desc      canOpenLink("docs.openharmony.cn") 因未声明 querySchemes 抛 17700056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCanOpenLinkMatrix0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMatrix0025 begin');
      const link: string = 'docs.openharmony.cn';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMatrix0025 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_CAN_OPEN_LINK_0026
     * @tc.name      testCanOpenLinkMatrix0026
     * @tc.desc      canOpenLink("://docs.openharmony.cn") 因未声明 querySchemes 抛 17700056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCanOpenLinkMatrix0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMatrix0026 begin');
      const link: string = '://docs.openharmony.cn';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMatrix0026 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_CAN_OPEN_LINK_0027
     * @tc.name      testCanOpenLinkMatrix0027
     * @tc.desc      canOpenLink("http://") 因未声明 querySchemes 抛 17700056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCanOpenLinkMatrix0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMatrix0027 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMatrix0027 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_CAN_OPEN_LINK_0028
     * @tc.name      testCanOpenLinkMatrix0028
     * @tc.desc      canOpenLink(空串) 因未声明 querySchemes 抛 17700056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCanOpenLinkMatrix0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMatrix0028 begin');
      const link: string = '';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMatrix0028 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_CAN_OPEN_LINK_0029
     * @tc.name      testCanOpenLinkMatrix0029
     * @tc.desc      canOpenLink("not a link") 因未声明 querySchemes 抛 17700056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCanOpenLinkMatrix0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMatrix0029 begin');
      const link: string = 'not a link';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMatrix0029 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_CAN_OPEN_LINK_0030
     * @tc.name      testCanOpenLinkMatrix0030
     * @tc.desc      canOpenLink("http://docs.openharmony.cn/中文") 因未声明 querySchemes 抛 17700056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCanOpenLinkMatrix0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMatrix0030 begin');
      const link: string = 'http://docs.openharmony.cn/中文';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMatrix0030 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_CAN_OPEN_LINK_0031
     * @tc.name      testCanOpenLinkMatrix0031
     * @tc.desc      canOpenLink("http://docs.openharmony.cn/%E4%B8%AD%E6%96%87") 因未声明 querySchemes 抛 17700056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCanOpenLinkMatrix0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMatrix0031 begin');
      const link: string = 'http://docs.openharmony.cn/%E4%B8%AD%E6%96%87';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpenLinkMatrix0031 end');
    })
  })
}
