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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { RouteTable } from '../../../../main/ets/utils/RouteTable';

const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_ResourceManager]';

function pagesOfSample(): string[] {
  return RouteTable.allPages();
}

export default function routeTableReal02Test() {
  describe('RouteTableReal02Test', () => {

    /**
     * @tc.name   testRouteTableReal0201
     * @tc.number SUB_RESMGR_ROUTE_REAL_0201
     * @tc.desc   解析结果再解析一次保持不变，回退只发生一次
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTableReal0201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableReal0201 begin');
      const pages: string[] = pagesOfSample();
      let stable: number = 0;
      for (let index: number = 0; index < pages.length; index++) {
        const once: string = RouteTable.resolvePage(pages[index]);
        if (RouteTable.resolvePage(once) === once) {
          stable++;
        }
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', stable, pages.length);
      expect(stable).assertEqual(pages.length);
      expect(stable).assertEqual(3);
      expect(RouteTable.resolvePage(RouteTable.PAGE_INDEX)).assertEqual(RouteTable.PAGE_INDEX);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableReal0201 end');
    })

    /**
     * @tc.name   testRouteTableReal0202
     * @tc.number SUB_RESMGR_ROUTE_REAL_0202
     * @tc.desc   页面序号大小写敏感，变形 url 一律返回 -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTableReal0202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableReal0202 begin');
      const upper: number = RouteTable.pageIndexOf('pages/INDEX');
      const spaced: number = RouteTable.pageIndexOf(' pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d/%{public}d expected=-1/-1', upper, spaced);
      expect(upper).assertEqual(-1);
      expect(spaced).assertEqual(-1);
      expect(RouteTable.pageIndexOf(RouteTable.PAGE_INDEX)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableReal0202 end');
    })

    /**
     * @tc.name   testRouteTableReal0203
     * @tc.number SUB_RESMGR_ROUTE_REAL_0203
     * @tc.desc   注册表里的每个页面都被 isKnownPage 承认，元素个数与序号逐一对应
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTableReal0203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableReal0203 begin');
      const pages: string[] = pagesOfSample();
      let known: number = 0;
      let indexed: number = 0;
      for (let index: number = 0; index < pages.length; index++) {
        if (RouteTable.isKnownPage(pages[index])) {
          known++;
        }
        if (RouteTable.pageIndexOf(pages[index]) === index) {
          indexed++;
        }
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d/%{public}d expected=%{public}d', known, indexed,
        pages.length);
      expect(known).assertEqual(pages.length);
      expect(indexed).assertEqual(pages.length);
      expect(known).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableReal0203 end');
    })

    /**
     * @tc.name   testRouteTableReal0204
     * @tc.number SUB_RESMGR_ROUTE_REAL_0204
     * @tc.desc   前缀判定要求完整的分隔斜杠，'pages' 本身不算页面地址
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTableReal0204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableReal0204 begin');
      const bare: boolean = RouteTable.isPageUrl('pages');
      const full: boolean = RouteTable.isPageUrl(RouteTable.PAGE_PREFIX);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s/%{public}s expected=false/true', String(bare), String(full));
      expect(bare).assertFalse();
      expect(full).assertTrue();
      expect(RouteTable.PAGE_PREFIX).assertEqual('pages/');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableReal0204 end');
    })

    /**
     * @tc.name   testRouteTableReal0205
     * @tc.number SUB_RESMGR_ROUTE_REAL_0205
     * @tc.desc   只要带前缀就算页面地址，但是否注册要看注册表
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTableReal0205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableReal0205 begin');
      const prefixOnly: string = RouteTable.PAGE_PREFIX;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=url:%{public}s known:%{public}s resolved:%{public}s',
        String(RouteTable.isPageUrl(prefixOnly)), String(RouteTable.isKnownPage(prefixOnly)),
        RouteTable.resolvePage(prefixOnly));
      expect(RouteTable.isPageUrl(prefixOnly)).assertTrue();
      expect(RouteTable.isKnownPage(prefixOnly)).assertFalse();
      expect(RouteTable.resolvePage(prefixOnly)).assertEqual(RouteTable.PAGE_INDEX);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableReal0205 end');
    })

    /**
     * @tc.name   testRouteTableReal0206
     * @tc.number SUB_RESMGR_ROUTE_REAL_0206
     * @tc.desc   公共事件名逐字匹配，大小写与空白差异都判为不匹配
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTableReal0206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableReal0206 begin');
      const lower: boolean = RouteTable.isResourcesEvent('testResourcesEvent');
      const spaced: boolean = RouteTable.isResourcesEvent(' TestResourcesEvent');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s/%{public}s expected=false/false', String(lower),
        String(spaced));
      expect(lower).assertFalse();
      expect(spaced).assertFalse();
      expect(RouteTable.isResourcesEvent(RouteTable.RESOURCES_EVENT)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableReal0206 end');
    })

    /**
     * @tc.name   testRouteTableReal0207
     * @tc.number SUB_RESMGR_ROUTE_REAL_0207
     * @tc.desc   三个页面常量互不相同，避免注册表出现重复项
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTableReal0207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableReal0207 begin');
      const index: string = RouteTable.PAGE_INDEX;
      const basic: string = RouteTable.PAGE_BASIC_RESOURCES;
      const overlay: string = RouteTable.PAGE_OVERLAY;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s/%{public}s/%{public}s', index, basic, overlay);
      expect(index === basic).assertFalse();
      expect(basic === overlay).assertFalse();
      expect(index === overlay).assertFalse();
      expect(index).assertEqual(RouteTable.PAGE_PREFIX + 'Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableReal0207 end');
    })

    /**
     * @tc.name   testRouteTableReal0208
     * @tc.number SUB_RESMGR_ROUTE_REAL_0208
     * @tc.desc   事件名不带页面前缀，不能被当成可跳转地址
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTableReal0208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableReal0208 begin');
      const event: string = RouteTable.RESOURCES_EVENT;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected not page url', event);
      expect(RouteTable.isPageUrl(event)).assertFalse();
      expect(RouteTable.isKnownPage(event)).assertFalse();
      expect(RouteTable.isResourcesEvent(event)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableReal0208 end');
    })

    /**
     * @tc.name   testRouteTableReal0209
     * @tc.number SUB_RESMGR_ROUTE_REAL_0209
     * @tc.desc   未注册但带前缀的地址统一回退到入口页
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTableReal0209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableReal0209 begin');
      const candidates: string[] = ['pages/Missing', 'pages/Index2', 'pages/BasicResources/Detail'];
      let fellBack: number = 0;
      for (let index: number = 0; index < candidates.length; index++) {
        if (RouteTable.resolvePage(candidates[index]) === RouteTable.PAGE_INDEX) {
          fellBack++;
        }
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', fellBack, candidates.length);
      expect(fellBack).assertEqual(3);
      expect(fellBack).assertEqual(candidates.length);
      expect(RouteTable.isPageUrl(candidates[0])).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableReal0209 end');
    })

    /**
     * @tc.name   testRouteTableReal0210
     * @tc.number SUB_RESMGR_ROUTE_REAL_0210
     * @tc.desc   注册表返回的数组元素都带页面前缀，长度固定为三
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTableReal0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableReal0210 begin');
      const pages: string[] = pagesOfSample();
      let prefixed: number = 0;
      for (let index: number = 0; index < pages.length; index++) {
        if (pages[index].startsWith(RouteTable.PAGE_PREFIX)) {
          prefixed++;
        }
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d/%{public}d expected=3', prefixed, pages.length);
      expect(prefixed).assertEqual(3);
      expect(pages.length).assertEqual(3);
      expect(prefixed).assertEqual(pages.length);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableReal0210 end');
    })

    /**
     * @tc.name   testRouteTableReal0211
     * @tc.number SUB_RESMGR_ROUTE_REAL_0211
     * @tc.desc   调用方改写返回数组不会改变注册表长度与内容
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTableReal0211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableReal0211 begin');
      const first: string[] = pagesOfSample();
      const snapshot: string = JSON.stringify(first);
      first.pop();
      first.push('pages/Injected');
      const second: string[] = pagesOfSample();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', JSON.stringify(second), snapshot);
      expect(JSON.stringify(second)).assertEqual(snapshot);
      expect(second.length).assertEqual(3);
      expect(RouteTable.isKnownPage('pages/Injected')).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableReal0211 end');
    })

    /**
     * @tc.name   testRouteTableReal0212
     * @tc.number SUB_RESMGR_ROUTE_REAL_0212
     * @tc.desc   空白串、空串与纯斜杠都被视为未知地址并回退
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTableReal0212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableReal0212 begin');
      const blank: string = RouteTable.resolvePage('   ');
      const empty: string = RouteTable.resolvePage('');
      const slash: string = RouteTable.resolvePage('/');
      const rawEmptyIndex: number = RouteTable.pageIndexOf('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s/%{public}s/%{public}s/%{public}d',
        blank, empty, slash, rawEmptyIndex);
      expect(blank).assertEqual(RouteTable.PAGE_INDEX);
      expect(empty).assertEqual(RouteTable.PAGE_INDEX);
      expect(slash).assertEqual(RouteTable.PAGE_INDEX);
      expect(rawEmptyIndex).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableReal0212 end');
    })

    /**
     * @tc.name   testRouteTableReal0213
     * @tc.number SUB_RESMGR_ROUTE_REAL_0213
     * @tc.desc   序号查找对同一个地址多次调用结果稳定，不会返回负数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTableReal0213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableReal0213 begin');
      const first: number = RouteTable.pageIndexOf(RouteTable.PAGE_OVERLAY);
      const second: number = RouteTable.pageIndexOf(RouteTable.PAGE_OVERLAY);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d/%{public}d expected=2', first, second);
      expect(first).assertEqual(second);
      expect(first).assertEqual(2);
      expect(first >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableReal0213 end');
    })

    /**
     * @tc.name   testRouteTableReal0214
     * @tc.number SUB_RESMGR_ROUTE_REAL_0214
     * @tc.desc   解析结果必定落在注册表内，未知输入不会产生新页面
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTableReal0214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableReal0214 begin');
      const inputs: string[] = ['pages/Overlay', 'pages/Unknown', '', 'pages/BasicResources'];
      let inside: number = 0;
      for (let index: number = 0; index < inputs.length; index++) {
        if (RouteTable.isKnownPage(RouteTable.resolvePage(inputs[index]))) {
          inside++;
        }
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', inside, inputs.length);
      expect(inside).assertEqual(4);
      expect(inside).assertEqual(inputs.length);
      expect(RouteTable.resolvePage('pages/Unknown')).assertEqual(RouteTable.PAGE_INDEX);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableReal0214 end');
    })
  })
}
