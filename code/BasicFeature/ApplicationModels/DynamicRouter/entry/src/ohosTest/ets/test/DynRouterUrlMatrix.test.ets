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
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_DynamicRouter]';

export default function dynRouterUrlMatrixTest(): void {
  describe('DynRouterUrlMatrixTest', () => {
    /**
     * @tc.number    SUB_DYNAMIC_ROUTER_URL_0001
     * @tc.name      dynRouterUrlMatrix0001
     * @tc.desc      HarA page1 的 url 首段是 har 名
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dynRouterUrlMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterUrlMatrix0001 begin');
      const url: string = 'HarA/src/main/ets/components/mainpage/page1/HapA_Router-HarA_Page1_Builder';
      const parts: Array<string> = url.split('/');
      const actual1: string = parts[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('HarA');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parts.length=${parts.length}`);
      expect(parts.length).assertEqual(8);
      const actual3: string = typeof parts[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('string');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterUrlMatrix0001 end');
    })

    /**
     * @tc.number    SUB_DYNAMIC_ROUTER_URL_0002
     * @tc.name      dynRouterUrlMatrix0002
     * @tc.desc      HarA page1 的 url 末段是路由名与 builder 名
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dynRouterUrlMatrix0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterUrlMatrix0002 begin');
      const url: string = 'HarA/src/main/ets/components/mainpage/page1/HapA_Router-HarA_Page1_Builder';
      const parts: Array<string> = url.split('/');
      const last: string = parts[parts.length - 1];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 last=${last}`);
      expect(last).assertEqual('HapA_Router-HarA_Page1_Builder');
      const actual2: boolean = last.indexOf('-') > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = last.endsWith('_Builder');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterUrlMatrix0002 end');
    })

    /**
     * @tc.number    SUB_DYNAMIC_ROUTER_URL_0003
     * @tc.name      dynRouterUrlMatrix0003
     * @tc.desc      HarA page1 的 url 中段是页面源码路径
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dynRouterUrlMatrix0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterUrlMatrix0003 begin');
      const url: string = 'HarA/src/main/ets/components/mainpage/page1/HapA_Router-HarA_Page1_Builder';
      const parts: Array<string> = url.split('/');
      const pagePath: string = parts.slice(1, 7).join('/');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 pagePath=${pagePath}`);
      expect(pagePath).assertEqual('src/main/ets/components/mainpage/page1');
      const actual2: string = parts[1];
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('src');
      const actual3: string = parts[5];
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('mainpage');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterUrlMatrix0003 end');
    })

    /**
     * @tc.number    SUB_DYNAMIC_ROUTER_URL_0004
     * @tc.name      dynRouterUrlMatrix0004
     * @tc.desc      HarA page2 的 url 首段是 har 名
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dynRouterUrlMatrix0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterUrlMatrix0004 begin');
      const url: string = 'HarA/src/main/ets/components/mainpage/page2/HapA_Router-HarA_Page2_Builder';
      const parts: Array<string> = url.split('/');
      const actual1: string = parts[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('HarA');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parts.length=${parts.length}`);
      expect(parts.length).assertEqual(8);
      const actual3: string = typeof parts[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('string');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterUrlMatrix0004 end');
    })

    /**
     * @tc.number    SUB_DYNAMIC_ROUTER_URL_0005
     * @tc.name      dynRouterUrlMatrix0005
     * @tc.desc      HarA page2 的 url 末段是路由名与 builder 名
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dynRouterUrlMatrix0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterUrlMatrix0005 begin');
      const url: string = 'HarA/src/main/ets/components/mainpage/page2/HapA_Router-HarA_Page2_Builder';
      const parts: Array<string> = url.split('/');
      const last: string = parts[parts.length - 1];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 last=${last}`);
      expect(last).assertEqual('HapA_Router-HarA_Page2_Builder');
      const actual2: boolean = last.indexOf('-') > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = last.endsWith('_Builder');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterUrlMatrix0005 end');
    })

    /**
     * @tc.number    SUB_DYNAMIC_ROUTER_URL_0006
     * @tc.name      dynRouterUrlMatrix0006
     * @tc.desc      HarA page2 的 url 中段是页面源码路径
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dynRouterUrlMatrix0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterUrlMatrix0006 begin');
      const url: string = 'HarA/src/main/ets/components/mainpage/page2/HapA_Router-HarA_Page2_Builder';
      const parts: Array<string> = url.split('/');
      const pagePath: string = parts.slice(1, 7).join('/');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 pagePath=${pagePath}`);
      expect(pagePath).assertEqual('src/main/ets/components/mainpage/page2');
      const actual2: string = parts[1];
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('src');
      const actual3: string = parts[5];
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('mainpage');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterUrlMatrix0006 end');
    })

    /**
     * @tc.number    SUB_DYNAMIC_ROUTER_URL_0007
     * @tc.name      dynRouterUrlMatrix0007
     * @tc.desc      HarA page3 的 url 首段是 har 名
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dynRouterUrlMatrix0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterUrlMatrix0007 begin');
      const url: string = 'HarA/src/main/ets/components/mainpage/page3/HapA_Router-HarA_Page3_Builder';
      const parts: Array<string> = url.split('/');
      const actual1: string = parts[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('HarA');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parts.length=${parts.length}`);
      expect(parts.length).assertEqual(8);
      const actual3: string = typeof parts[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('string');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterUrlMatrix0007 end');
    })

    /**
     * @tc.number    SUB_DYNAMIC_ROUTER_URL_0008
     * @tc.name      dynRouterUrlMatrix0008
     * @tc.desc      HarA page3 的 url 末段是路由名与 builder 名
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dynRouterUrlMatrix0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterUrlMatrix0008 begin');
      const url: string = 'HarA/src/main/ets/components/mainpage/page3/HapA_Router-HarA_Page3_Builder';
      const parts: Array<string> = url.split('/');
      const last: string = parts[parts.length - 1];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 last=${last}`);
      expect(last).assertEqual('HapA_Router-HarA_Page3_Builder');
      const actual2: boolean = last.indexOf('-') > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = last.endsWith('_Builder');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterUrlMatrix0008 end');
    })

    /**
     * @tc.number    SUB_DYNAMIC_ROUTER_URL_0009
     * @tc.name      dynRouterUrlMatrix0009
     * @tc.desc      HarA page3 的 url 中段是页面源码路径
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dynRouterUrlMatrix0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterUrlMatrix0009 begin');
      const url: string = 'HarA/src/main/ets/components/mainpage/page3/HapA_Router-HarA_Page3_Builder';
      const parts: Array<string> = url.split('/');
      const pagePath: string = parts.slice(1, 7).join('/');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 pagePath=${pagePath}`);
      expect(pagePath).assertEqual('src/main/ets/components/mainpage/page3');
      const actual2: string = parts[1];
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('src');
      const actual3: string = parts[5];
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('mainpage');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterUrlMatrix0009 end');
    })

    /**
     * @tc.number    SUB_DYNAMIC_ROUTER_URL_0010
     * @tc.name      dynRouterUrlMatrix0010
     * @tc.desc      HarB page1 的 url 首段是 har 名
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dynRouterUrlMatrix0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterUrlMatrix0010 begin');
      const url: string = 'HarB/src/main/ets/components/mainpage/page1/HapA_Router-HarB_Page1_Builder';
      const parts: Array<string> = url.split('/');
      const actual1: string = parts[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('HarB');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parts.length=${parts.length}`);
      expect(parts.length).assertEqual(8);
      const actual3: string = typeof parts[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('string');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterUrlMatrix0010 end');
    })

    /**
     * @tc.number    SUB_DYNAMIC_ROUTER_URL_0011
     * @tc.name      dynRouterUrlMatrix0011
     * @tc.desc      HarB page1 的 url 末段是路由名与 builder 名
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dynRouterUrlMatrix0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterUrlMatrix0011 begin');
      const url: string = 'HarB/src/main/ets/components/mainpage/page1/HapA_Router-HarB_Page1_Builder';
      const parts: Array<string> = url.split('/');
      const last: string = parts[parts.length - 1];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 last=${last}`);
      expect(last).assertEqual('HapA_Router-HarB_Page1_Builder');
      const actual2: boolean = last.indexOf('-') > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = last.endsWith('_Builder');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterUrlMatrix0011 end');
    })

    /**
     * @tc.number    SUB_DYNAMIC_ROUTER_URL_0012
     * @tc.name      dynRouterUrlMatrix0012
     * @tc.desc      HarB page1 的 url 中段是页面源码路径
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dynRouterUrlMatrix0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterUrlMatrix0012 begin');
      const url: string = 'HarB/src/main/ets/components/mainpage/page1/HapA_Router-HarB_Page1_Builder';
      const parts: Array<string> = url.split('/');
      const pagePath: string = parts.slice(1, 7).join('/');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 pagePath=${pagePath}`);
      expect(pagePath).assertEqual('src/main/ets/components/mainpage/page1');
      const actual2: string = parts[1];
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('src');
      const actual3: string = parts[5];
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('mainpage');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterUrlMatrix0012 end');
    })

    /**
     * @tc.number    SUB_DYNAMIC_ROUTER_URL_0013
     * @tc.name      dynRouterUrlMatrix0013
     * @tc.desc      HarB page2 的 url 首段是 har 名
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dynRouterUrlMatrix0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterUrlMatrix0013 begin');
      const url: string = 'HarB/src/main/ets/components/mainpage/page2/HapA_Router-HarB_Page2_Builder';
      const parts: Array<string> = url.split('/');
      const actual1: string = parts[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('HarB');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parts.length=${parts.length}`);
      expect(parts.length).assertEqual(8);
      const actual3: string = typeof parts[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('string');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterUrlMatrix0013 end');
    })

    /**
     * @tc.number    SUB_DYNAMIC_ROUTER_URL_0014
     * @tc.name      dynRouterUrlMatrix0014
     * @tc.desc      HarB page2 的 url 末段是路由名与 builder 名
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dynRouterUrlMatrix0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterUrlMatrix0014 begin');
      const url: string = 'HarB/src/main/ets/components/mainpage/page2/HapA_Router-HarB_Page2_Builder';
      const parts: Array<string> = url.split('/');
      const last: string = parts[parts.length - 1];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 last=${last}`);
      expect(last).assertEqual('HapA_Router-HarB_Page2_Builder');
      const actual2: boolean = last.indexOf('-') > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = last.endsWith('_Builder');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterUrlMatrix0014 end');
    })

    /**
     * @tc.number    SUB_DYNAMIC_ROUTER_URL_0015
     * @tc.name      dynRouterUrlMatrix0015
     * @tc.desc      HarB page2 的 url 中段是页面源码路径
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dynRouterUrlMatrix0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterUrlMatrix0015 begin');
      const url: string = 'HarB/src/main/ets/components/mainpage/page2/HapA_Router-HarB_Page2_Builder';
      const parts: Array<string> = url.split('/');
      const pagePath: string = parts.slice(1, 7).join('/');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 pagePath=${pagePath}`);
      expect(pagePath).assertEqual('src/main/ets/components/mainpage/page2');
      const actual2: string = parts[1];
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('src');
      const actual3: string = parts[5];
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('mainpage');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterUrlMatrix0015 end');
    })

    /**
     * @tc.number    SUB_DYNAMIC_ROUTER_URL_0016
     * @tc.name      dynRouterUrlMatrix0016
     * @tc.desc      HarB page3 的 url 首段是 har 名
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dynRouterUrlMatrix0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterUrlMatrix0016 begin');
      const url: string = 'HarB/src/main/ets/components/mainpage/page3/HapA_Router-HarB_Page3_Builder';
      const parts: Array<string> = url.split('/');
      const actual1: string = parts[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('HarB');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parts.length=${parts.length}`);
      expect(parts.length).assertEqual(8);
      const actual3: string = typeof parts[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('string');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterUrlMatrix0016 end');
    })

    /**
     * @tc.number    SUB_DYNAMIC_ROUTER_URL_0017
     * @tc.name      dynRouterUrlMatrix0017
     * @tc.desc      HarB page3 的 url 末段是路由名与 builder 名
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dynRouterUrlMatrix0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterUrlMatrix0017 begin');
      const url: string = 'HarB/src/main/ets/components/mainpage/page3/HapA_Router-HarB_Page3_Builder';
      const parts: Array<string> = url.split('/');
      const last: string = parts[parts.length - 1];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 last=${last}`);
      expect(last).assertEqual('HapA_Router-HarB_Page3_Builder');
      const actual2: boolean = last.indexOf('-') > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = last.endsWith('_Builder');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterUrlMatrix0017 end');
    })

    /**
     * @tc.number    SUB_DYNAMIC_ROUTER_URL_0018
     * @tc.name      dynRouterUrlMatrix0018
     * @tc.desc      HarB page3 的 url 中段是页面源码路径
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dynRouterUrlMatrix0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterUrlMatrix0018 begin');
      const url: string = 'HarB/src/main/ets/components/mainpage/page3/HapA_Router-HarB_Page3_Builder';
      const parts: Array<string> = url.split('/');
      const pagePath: string = parts.slice(1, 7).join('/');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 pagePath=${pagePath}`);
      expect(pagePath).assertEqual('src/main/ets/components/mainpage/page3');
      const actual2: string = parts[1];
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('src');
      const actual3: string = parts[5];
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('mainpage');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterUrlMatrix0018 end');
    })
  })
}
