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

import { describe, it, expect, beforeAll, afterAll } from '@ohos/hypium';

class DeviceCompatibilityRouteScenario0 {
  private builders: Map<string, string> = new Map<string, string>();
  private routers: Map<string, string[]> = new Map<string, string[]>();
  public registerBuilder(name: string, har: string): number { this.builders.set(name, har); return this.builders.size; }
  public getBuilder(name: string): string { const v = this.builders.get(name); return v === undefined ? '' : v; }
  public hasBuilder(name: string): boolean { return this.builders.has(name); }
  public countBuilders(): number { return this.builders.size; }
  public createRouter(name: string): number { if (!this.routers.has(name)) { this.routers.set(name, []); } return this.routers.size; }
  public countRouters(): number { return this.routers.size; }
  public addToStack(router: string, page: string): number { if (!this.routers.has(router)) { this.routers.set(router, []); } const s = this.routers.get(router); if (s === undefined) { return 0; } s.push(page); return s.length; }
  public depth(router: string): number { const s = this.routers.get(router); return s === undefined ? 0 : s.length; }
  public top(router: string): string { const s = this.routers.get(router); if (s === undefined || s.length === 0) { return ''; } return s[s.length - 1]; }
  public pop(router: string): boolean { const s = this.routers.get(router); if (s === undefined || s.length === 0) { return false; } s.pop(); return true; }
  public clear(router: string): void { if (this.routers.has(router)) { this.routers.set(router, []); } }
  public resolveBuilder(url: string): string { const parts: string[] = url.split('/'); const ctx: string[] = parts[parts.length - 1].split('-'); return ctx.length > 1 ? ctx[1] : ''; }
}

interface DeviceCompatibilityRouteUrlParser1Route {
  harName: string;
  path: string;
  routerName: string;
  builderName: string;
}
class DeviceCompatibilityRouteUrlParser1 {
  public static parse(url: string): DeviceCompatibilityRouteUrlParser1Route {
    const parts: string[] = url.split('/');
    const harName: string = parts[0];
    const ctx: string[] = parts[parts.length - 1].split('-');
    const routerName: string = ctx[0];
    const builderName: string = ctx.length > 1 ? ctx[1] : '';
    let path: string = '.';
    for (let i = 1; i < parts.length - 1; i++) { path = path + '/' + parts[i]; }
    const route: DeviceCompatibilityRouteUrlParser1Route = { harName: harName, path: path, routerName: routerName, builderName: builderName };
    return route;
  }
  public static harOf(url: string): string { const parts: string[] = url.split('/'); return parts[0]; }
  public static builderOf(url: string): string { const parts: string[] = url.split('/'); const ctx: string[] = parts[parts.length - 1].split('-'); return ctx.length > 1 ? ctx[1] : ''; }
}


export default function integrationDeviceCompatibilityTest() {
  describe('Integration_DeviceCompatibility_Test', () => {
    beforeAll(async () => {
    });
    afterAll(async () => {
    });
    it('router_case_0', 0, async () => {
      const s = new DeviceCompatibilityRouteScenario0();
      s.registerBuilder('HarA_Page1_Builder', 'HarA');
      s.createRouter('HapA_Router');
      for (let n = 0; n < 1; n++) { s.addToStack('HapA_Router', 'page' + n); }
      expect(s.countBuilders()).assertEqual(1);
      expect(s.depth('HapA_Router')).assertEqual(1);
      expect(s.getBuilder('HarA_Page1_Builder')).assertEqual('HarA');
      expect(s.top('HapA_Router')).assertEqual('page' + (1 - 1));
    });
    it('router_case_1', 0, async () => {
      const s = new DeviceCompatibilityRouteScenario0();
      s.registerBuilder('HarA_Page2_Builder', 'HarA');
      s.createRouter('HapA_Router');
      for (let n = 0; n < 2; n++) { s.addToStack('HapA_Router', 'page' + n); }
      expect(s.countBuilders()).assertEqual(1);
      expect(s.depth('HapA_Router')).assertEqual(2);
      expect(s.getBuilder('HarA_Page2_Builder')).assertEqual('HarA');
      expect(s.top('HapA_Router')).assertEqual('page' + (2 - 1));
    });
    it('router_case_2', 0, async () => {
      const s = new DeviceCompatibilityRouteScenario0();
      s.registerBuilder('HarA_Page3_Builder', 'HarA');
      s.createRouter('HapA_Router');
      for (let n = 0; n < 3; n++) { s.addToStack('HapA_Router', 'page' + n); }
      expect(s.countBuilders()).assertEqual(1);
      expect(s.depth('HapA_Router')).assertEqual(3);
      expect(s.getBuilder('HarA_Page3_Builder')).assertEqual('HarA');
      expect(s.top('HapA_Router')).assertEqual('page' + (3 - 1));
    });
  });
}

