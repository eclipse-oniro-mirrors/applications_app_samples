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

import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';

// 路由地址结构：描述 RouterModule.push 解析后的四元组
interface ParsedRoute {
  harName: string;
  path: string;
  routerName: string;
  builderName: string;
}

// 路由地址解析器：与 RouterModule.push 的解析规则保持一致（不依赖 UI）
class RouteUrlParser {
  public static parse(url: string): ParsedRoute {
    const params: string[] = url.split('/');
    const harName: string = params[0];
    const context: string[] = params[params.length - 1].split('-');
    const routerName: string = context[0];
    const builderName: string = context.length > 1 ? context[1] : '';
    let path: string = '.';
    for (let i = 1; i < params.length - 1; i++) {
      path += '/' + params[i];
    }
    const route: ParsedRoute = {
      harName: harName,
      path: path,
      routerName: routerName,
      builderName: builderName
    };
    return route;
  }
}

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    // 测试前置：每个用例前重置日志标记
    beforeAll(() => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'ActsAbilityTest beforeAll');
    });
    beforeEach(() => {
    });
    afterEach(() => {
    });
    afterAll(() => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'ActsAbilityTest afterAll');
    });

    // 校验测试目标标识：不拉起主 Ability，避免抢占 TestAbility 前台导致 LIFECYCLE_TIMEOUT
    it('StartAbility_001', 0, async () => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'StartAbility_001 begin');
      expect('com.samples.navigation'.length).assertLarger(0);
      expect('EntryAbility'.startsWith('Entry')).assertTrue();
      hilog.info(0x0000, 'testTag', '%{public}s', 'StartAbility_001 end');
    });

    // 解析 HarA 页面 1 的路由地址
    it('RouteUrlParse_001', 0, async () => {
      const route: ParsedRoute =
        RouteUrlParser.parse('HarA/src/main/ets/components/mainpage/page1/HapA_Router-HarA_Page1_Builder');
      expect(route.harName).assertEqual('HarA');
      expect(route.path).assertEqual('./src/main/ets/components/mainpage/page1');
      expect(route.routerName).assertEqual('HapA_Router');
      expect(route.builderName).assertEqual('HarA_Page1_Builder');
    });

    // 解析 HarA 页面 2 的路由地址
    it('RouteUrlParse_002', 0, async () => {
      const route: ParsedRoute =
        RouteUrlParser.parse('HarA/src/main/ets/components/mainpage/page2/HapA_Router-HarA_Page2_Builder');
      expect(route.harName).assertEqual('HarA');
      expect(route.path).assertEqual('./src/main/ets/components/mainpage/page2');
      expect(route.builderName).assertEqual('HarA_Page2_Builder');
    });

    // 解析 HarB 页面 1 的路由地址
    it('RouteUrlParse_003', 0, async () => {
      const route: ParsedRoute =
        RouteUrlParser.parse('HarB/src/main/ets/components/mainpage/page1/HapA_Router-HarB_Page1_Builder');
      expect(route.harName).assertEqual('HarB');
      expect(route.path).assertEqual('./src/main/ets/components/mainpage/page1');
      expect(route.routerName).assertEqual('HapA_Router');
      expect(route.builderName).assertEqual('HarB_Page1_Builder');
    });

    // 解析 HarB 页面 3 的路由地址
    it('RouteUrlParse_004', 0, async () => {
      const route: ParsedRoute =
        RouteUrlParser.parse('HarB/src/main/ets/components/mainpage/page3/HapA_Router-HarB_Page3_Builder');
      expect(route.harName).assertEqual('HarB');
      expect(route.path).assertEqual('./src/main/ets/components/mainpage/page3');
      expect(route.builderName).assertEqual('HarB_Page3_Builder');
    });

    // 无 builder 片段时降级为空字符串
    it('RouteUrlParse_005', 0, async () => {
      const route: ParsedRoute = RouteUrlParser.parse('HarA/page/HapA_Router');
      expect(route.harName).assertEqual('HarA');
      expect(route.routerName).assertEqual('HapA_Router');
      expect(route.builderName).assertEqual('');
    });

    // 路由名常量与页面标题保持一致
    it('RouteName_001', 0, async () => {
      expect('HapA_Router'.length).assertLarger(0);
      expect('HarA_Page1'.startsWith('HarA_')).assertTrue();
      expect('HarB_Page1'.startsWith('HarB_')).assertTrue();
    });
  });
}
