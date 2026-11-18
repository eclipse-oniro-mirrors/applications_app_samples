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

class AnimationControllerValidationRouteScenario0 {
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

interface AnimationControllerValidationRouteUrlParser1Route {
  harName: string;
  path: string;
  routerName: string;
  builderName: string;
}
class AnimationControllerValidationRouteUrlParser1 {
  public static parse(url: string): AnimationControllerValidationRouteUrlParser1Route {
    const parts: string[] = url.split('/');
    const harName: string = parts[0];
    const ctx: string[] = parts[parts.length - 1].split('-');
    const routerName: string = ctx[0];
    const builderName: string = ctx.length > 1 ? ctx[1] : '';
    let path: string = '.';
    for (let i = 1; i < parts.length - 1; i++) { path = path + '/' + parts[i]; }
    const route: AnimationControllerValidationRouteUrlParser1Route = { harName: harName, path: path, routerName: routerName, builderName: builderName };
    return route;
  }
  public static harOf(url: string): string { const parts: string[] = url.split('/'); return parts[0]; }
  public static builderOf(url: string): string { const parts: string[] = url.split('/'); const ctx: string[] = parts[parts.length - 1].split('-'); return ctx.length > 1 ? ctx[1] : ''; }
}

class AnimationControllerValidationBuilderRegistry2 {
  private items: Map<string, string> = new Map<string, string>();
  public register(name: string, har: string): number { this.items.set(name, har); return this.items.size; }
  public resolve(name: string): string { const v = this.items.get(name); return v === undefined ? '' : v; }
  public has(name: string): boolean { return this.items.has(name); }
  public remove(name: string): boolean { return this.items.delete(name); }
  public size(): number { return this.items.size; }
  public names(): string[] { const r: string[] = []; this.items.forEach((v: string, k: string) => { r.push(k); }); return r; }
  public clear(): void { this.items = new Map<string, string>(); }
}

class AnimationControllerValidationNavStackModel3 {
  private stack: string[] = [];
  public push(page: string): number { this.stack.push(page); return this.stack.length; }
  public pop(): string { const v = this.stack.pop(); return v === undefined ? '' : v; }
  public clear(): void { this.stack = []; }
  public depth(): number { return this.stack.length; }
  public top(): string { if (this.stack.length === 0) { return ''; } return this.stack[this.stack.length - 1]; }
  public contains(page: string): boolean { for (let i = 0; i < this.stack.length; i++) { if (this.stack[i] === page) { return true; } } return false; }
}

class AnimationControllerValidationHarInitResolver4 {
  public resolve(path: string): string {
    if (path === './src/main/ets/components/mainpage/page1') { return 'page1'; }
    if (path === './src/main/ets/components/mainpage/page2') { return 'page2'; }
    if (path === './src/main/ets/components/mainpage/page3') { return 'page3'; }
    return '';
  }
  public isKnown(path: string): boolean { return this.resolve(path) !== ''; }
  public importPath(path: string): string { const page: string = this.resolve(path); return page === '' ? '' : path + '.ets'; }
}

class AnimationControllerValidationPageCatalog5 {
  private titles: string[] = ['HarA_Page1', 'HarA_Page2', 'HarA_Page3', 'HarB_Page1', 'HarB_Page2', 'HarB_Page3'];
  private buttons: string[] = ['ToHarAPage1', 'ToHarAPage2', 'ToHarAPage3', 'ToHarBPage1', 'ToHarBPage2', 'ToHarBPage3'];
  public titleCount(): number { return this.titles.length; }
  public buttonCount(): number { return this.buttons.length; }
  public titleAt(index: number): string { if (index < 0 || index >= this.titles.length) { return ''; } return this.titles[index]; }
  public buttonAt(index: number): string { if (index < 0 || index >= this.buttons.length) { return ''; } return this.buttons[index]; }
  public containsTitle(title: string): boolean { for (let i = 0; i < this.titles.length; i++) { if (this.titles[i] === title) { return true; } } return false; }
}

class AnimationControllerValidationRouteStats6 {
  private values: number[] = [];
  public add(value: number): number { this.values.push(value); return this.values.length; }
  public count(): number { return this.values.length; }
  public total(): number { let t = 0; for (let i = 0; i < this.values.length; i++) { t = t + this.values[i]; } return t; }
  public average(): number { if (this.values.length === 0) { return 0; } return this.total() / this.values.length; }
  public max(): number { let m = 0; for (let i = 0; i < this.values.length; i++) { if (this.values[i] > m) { m = this.values[i]; } } return m; }
  public clear(): void { this.values = []; }
}

class AnimationControllerValidationRouteNameValidator7 {
  public isBuilderName(name: string): boolean { return name.endsWith('_Builder'); }
  public isRouterName(name: string): boolean { return name.length > 0 && name.endsWith('_Router'); }
  public isPageTitle(title: string): boolean { return title.startsWith('HarA_') || title.startsWith('HarB_'); }
  public isButtonLabel(label: string): boolean { return label.startsWith('To'); }
  public isNonEmpty(text: string): boolean { return text.length > 0; }
}

class AnimationControllerValidationRouteScenario8 {
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

interface AnimationControllerValidationRouteUrlParser9Route {
  harName: string;
  path: string;
  routerName: string;
  builderName: string;
}
class AnimationControllerValidationRouteUrlParser9 {
  public static parse(url: string): AnimationControllerValidationRouteUrlParser9Route {
    const parts: string[] = url.split('/');
    const harName: string = parts[0];
    const ctx: string[] = parts[parts.length - 1].split('-');
    const routerName: string = ctx[0];
    const builderName: string = ctx.length > 1 ? ctx[1] : '';
    let path: string = '.';
    for (let i = 1; i < parts.length - 1; i++) { path = path + '/' + parts[i]; }
    const route: AnimationControllerValidationRouteUrlParser9Route = { harName: harName, path: path, routerName: routerName, builderName: builderName };
    return route;
  }
  public static harOf(url: string): string { const parts: string[] = url.split('/'); return parts[0]; }
  public static builderOf(url: string): string { const parts: string[] = url.split('/'); const ctx: string[] = parts[parts.length - 1].split('-'); return ctx.length > 1 ? ctx[1] : ''; }
}

class AnimationControllerValidationBuilderRegistry10 {
  private items: Map<string, string> = new Map<string, string>();
  public register(name: string, har: string): number { this.items.set(name, har); return this.items.size; }
  public resolve(name: string): string { const v = this.items.get(name); return v === undefined ? '' : v; }
  public has(name: string): boolean { return this.items.has(name); }
  public remove(name: string): boolean { return this.items.delete(name); }
  public size(): number { return this.items.size; }
  public names(): string[] { const r: string[] = []; this.items.forEach((v: string, k: string) => { r.push(k); }); return r; }
  public clear(): void { this.items = new Map<string, string>(); }
}

class AnimationControllerValidationNavStackModel11 {
  private stack: string[] = [];
  public push(page: string): number { this.stack.push(page); return this.stack.length; }
  public pop(): string { const v = this.stack.pop(); return v === undefined ? '' : v; }
  public clear(): void { this.stack = []; }
  public depth(): number { return this.stack.length; }
  public top(): string { if (this.stack.length === 0) { return ''; } return this.stack[this.stack.length - 1]; }
  public contains(page: string): boolean { for (let i = 0; i < this.stack.length; i++) { if (this.stack[i] === page) { return true; } } return false; }
}

class AnimationControllerValidationHarInitResolver12 {
  public resolve(path: string): string {
    if (path === './src/main/ets/components/mainpage/page1') { return 'page1'; }
    if (path === './src/main/ets/components/mainpage/page2') { return 'page2'; }
    if (path === './src/main/ets/components/mainpage/page3') { return 'page3'; }
    return '';
  }
  public isKnown(path: string): boolean { return this.resolve(path) !== ''; }
  public importPath(path: string): string { const page: string = this.resolve(path); return page === '' ? '' : path + '.ets'; }
}

class AnimationControllerValidationPageCatalog13 {
  private titles: string[] = ['HarA_Page1', 'HarA_Page2', 'HarA_Page3', 'HarB_Page1', 'HarB_Page2', 'HarB_Page3'];
  private buttons: string[] = ['ToHarAPage1', 'ToHarAPage2', 'ToHarAPage3', 'ToHarBPage1', 'ToHarBPage2', 'ToHarBPage3'];
  public titleCount(): number { return this.titles.length; }
  public buttonCount(): number { return this.buttons.length; }
  public titleAt(index: number): string { if (index < 0 || index >= this.titles.length) { return ''; } return this.titles[index]; }
  public buttonAt(index: number): string { if (index < 0 || index >= this.buttons.length) { return ''; } return this.buttons[index]; }
  public containsTitle(title: string): boolean { for (let i = 0; i < this.titles.length; i++) { if (this.titles[i] === title) { return true; } } return false; }
}

class AnimationControllerValidationRouteStats14 {
  private values: number[] = [];
  public add(value: number): number { this.values.push(value); return this.values.length; }
  public count(): number { return this.values.length; }
  public total(): number { let t = 0; for (let i = 0; i < this.values.length; i++) { t = t + this.values[i]; } return t; }
  public average(): number { if (this.values.length === 0) { return 0; } return this.total() / this.values.length; }
  public max(): number { let m = 0; for (let i = 0; i < this.values.length; i++) { if (this.values[i] > m) { m = this.values[i]; } } return m; }
  public clear(): void { this.values = []; }
}

class AnimationControllerValidationRouteNameValidator15 {
  public isBuilderName(name: string): boolean { return name.endsWith('_Builder'); }
  public isRouterName(name: string): boolean { return name.length > 0 && name.endsWith('_Router'); }
  public isPageTitle(title: string): boolean { return title.startsWith('HarA_') || title.startsWith('HarB_'); }
  public isButtonLabel(label: string): boolean { return label.startsWith('To'); }
  public isNonEmpty(text: string): boolean { return text.length > 0; }
}

class AnimationControllerValidationRouteScenario16 {
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

interface AnimationControllerValidationRouteUrlParser17Route {
  harName: string;
  path: string;
  routerName: string;
  builderName: string;
}
class AnimationControllerValidationRouteUrlParser17 {
  public static parse(url: string): AnimationControllerValidationRouteUrlParser17Route {
    const parts: string[] = url.split('/');
    const harName: string = parts[0];
    const ctx: string[] = parts[parts.length - 1].split('-');
    const routerName: string = ctx[0];
    const builderName: string = ctx.length > 1 ? ctx[1] : '';
    let path: string = '.';
    for (let i = 1; i < parts.length - 1; i++) { path = path + '/' + parts[i]; }
    const route: AnimationControllerValidationRouteUrlParser17Route = { harName: harName, path: path, routerName: routerName, builderName: builderName };
    return route;
  }
  public static harOf(url: string): string { const parts: string[] = url.split('/'); return parts[0]; }
  public static builderOf(url: string): string { const parts: string[] = url.split('/'); const ctx: string[] = parts[parts.length - 1].split('-'); return ctx.length > 1 ? ctx[1] : ''; }
}

class AnimationControllerValidationBuilderRegistry18 {
  private items: Map<string, string> = new Map<string, string>();
  public register(name: string, har: string): number { this.items.set(name, har); return this.items.size; }
  public resolve(name: string): string { const v = this.items.get(name); return v === undefined ? '' : v; }
  public has(name: string): boolean { return this.items.has(name); }
  public remove(name: string): boolean { return this.items.delete(name); }
  public size(): number { return this.items.size; }
  public names(): string[] { const r: string[] = []; this.items.forEach((v: string, k: string) => { r.push(k); }); return r; }
  public clear(): void { this.items = new Map<string, string>(); }
}

class AnimationControllerValidationNavStackModel19 {
  private stack: string[] = [];
  public push(page: string): number { this.stack.push(page); return this.stack.length; }
  public pop(): string { const v = this.stack.pop(); return v === undefined ? '' : v; }
  public clear(): void { this.stack = []; }
  public depth(): number { return this.stack.length; }
  public top(): string { if (this.stack.length === 0) { return ''; } return this.stack[this.stack.length - 1]; }
  public contains(page: string): boolean { for (let i = 0; i < this.stack.length; i++) { if (this.stack[i] === page) { return true; } } return false; }
}

class AnimationControllerValidationHarInitResolver20 {
  public resolve(path: string): string {
    if (path === './src/main/ets/components/mainpage/page1') { return 'page1'; }
    if (path === './src/main/ets/components/mainpage/page2') { return 'page2'; }
    if (path === './src/main/ets/components/mainpage/page3') { return 'page3'; }
    return '';
  }
  public isKnown(path: string): boolean { return this.resolve(path) !== ''; }
  public importPath(path: string): string { const page: string = this.resolve(path); return page === '' ? '' : path + '.ets'; }
}

class AnimationControllerValidationPageCatalog21 {
  private titles: string[] = ['HarA_Page1', 'HarA_Page2', 'HarA_Page3', 'HarB_Page1', 'HarB_Page2', 'HarB_Page3'];
  private buttons: string[] = ['ToHarAPage1', 'ToHarAPage2', 'ToHarAPage3', 'ToHarBPage1', 'ToHarBPage2', 'ToHarBPage3'];
  public titleCount(): number { return this.titles.length; }
  public buttonCount(): number { return this.buttons.length; }
  public titleAt(index: number): string { if (index < 0 || index >= this.titles.length) { return ''; } return this.titles[index]; }
  public buttonAt(index: number): string { if (index < 0 || index >= this.buttons.length) { return ''; } return this.buttons[index]; }
  public containsTitle(title: string): boolean { for (let i = 0; i < this.titles.length; i++) { if (this.titles[i] === title) { return true; } } return false; }
}

class AnimationControllerValidationRouteStats22 {
  private values: number[] = [];
  public add(value: number): number { this.values.push(value); return this.values.length; }
  public count(): number { return this.values.length; }
  public total(): number { let t = 0; for (let i = 0; i < this.values.length; i++) { t = t + this.values[i]; } return t; }
  public average(): number { if (this.values.length === 0) { return 0; } return this.total() / this.values.length; }
  public max(): number { let m = 0; for (let i = 0; i < this.values.length; i++) { if (this.values[i] > m) { m = this.values[i]; } } return m; }
  public clear(): void { this.values = []; }
}

class AnimationControllerValidationRouteNameValidator23 {
  public isBuilderName(name: string): boolean { return name.endsWith('_Builder'); }
  public isRouterName(name: string): boolean { return name.length > 0 && name.endsWith('_Router'); }
  public isPageTitle(title: string): boolean { return title.startsWith('HarA_') || title.startsWith('HarB_'); }
  public isButtonLabel(label: string): boolean { return label.startsWith('To'); }
  public isNonEmpty(text: string): boolean { return text.length > 0; }
}

class AnimationControllerValidationRouteScenario24 {
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

interface AnimationControllerValidationRouteUrlParser25Route {
  harName: string;
  path: string;
  routerName: string;
  builderName: string;
}
class AnimationControllerValidationRouteUrlParser25 {
  public static parse(url: string): AnimationControllerValidationRouteUrlParser25Route {
    const parts: string[] = url.split('/');
    const harName: string = parts[0];
    const ctx: string[] = parts[parts.length - 1].split('-');
    const routerName: string = ctx[0];
    const builderName: string = ctx.length > 1 ? ctx[1] : '';
    let path: string = '.';
    for (let i = 1; i < parts.length - 1; i++) { path = path + '/' + parts[i]; }
    const route: AnimationControllerValidationRouteUrlParser25Route = { harName: harName, path: path, routerName: routerName, builderName: builderName };
    return route;
  }
  public static harOf(url: string): string { const parts: string[] = url.split('/'); return parts[0]; }
  public static builderOf(url: string): string { const parts: string[] = url.split('/'); const ctx: string[] = parts[parts.length - 1].split('-'); return ctx.length > 1 ? ctx[1] : ''; }
}

class AnimationControllerValidationBuilderRegistry26 {
  private items: Map<string, string> = new Map<string, string>();
  public register(name: string, har: string): number { this.items.set(name, har); return this.items.size; }
  public resolve(name: string): string { const v = this.items.get(name); return v === undefined ? '' : v; }
  public has(name: string): boolean { return this.items.has(name); }
  public remove(name: string): boolean { return this.items.delete(name); }
  public size(): number { return this.items.size; }
  public names(): string[] { const r: string[] = []; this.items.forEach((v: string, k: string) => { r.push(k); }); return r; }
  public clear(): void { this.items = new Map<string, string>(); }
}

class AnimationControllerValidationNavStackModel27 {
  private stack: string[] = [];
  public push(page: string): number { this.stack.push(page); return this.stack.length; }
  public pop(): string { const v = this.stack.pop(); return v === undefined ? '' : v; }
  public clear(): void { this.stack = []; }
  public depth(): number { return this.stack.length; }
  public top(): string { if (this.stack.length === 0) { return ''; } return this.stack[this.stack.length - 1]; }
  public contains(page: string): boolean { for (let i = 0; i < this.stack.length; i++) { if (this.stack[i] === page) { return true; } } return false; }
}

class AnimationControllerValidationHarInitResolver28 {
  public resolve(path: string): string {
    if (path === './src/main/ets/components/mainpage/page1') { return 'page1'; }
    if (path === './src/main/ets/components/mainpage/page2') { return 'page2'; }
    if (path === './src/main/ets/components/mainpage/page3') { return 'page3'; }
    return '';
  }
  public isKnown(path: string): boolean { return this.resolve(path) !== ''; }
  public importPath(path: string): string { const page: string = this.resolve(path); return page === '' ? '' : path + '.ets'; }
}

class AnimationControllerValidationPageCatalog29 {
  private titles: string[] = ['HarA_Page1', 'HarA_Page2', 'HarA_Page3', 'HarB_Page1', 'HarB_Page2', 'HarB_Page3'];
  private buttons: string[] = ['ToHarAPage1', 'ToHarAPage2', 'ToHarAPage3', 'ToHarBPage1', 'ToHarBPage2', 'ToHarBPage3'];
  public titleCount(): number { return this.titles.length; }
  public buttonCount(): number { return this.buttons.length; }
  public titleAt(index: number): string { if (index < 0 || index >= this.titles.length) { return ''; } return this.titles[index]; }
  public buttonAt(index: number): string { if (index < 0 || index >= this.buttons.length) { return ''; } return this.buttons[index]; }
  public containsTitle(title: string): boolean { for (let i = 0; i < this.titles.length; i++) { if (this.titles[i] === title) { return true; } } return false; }
}

class AnimationControllerValidationRouteStats30 {
  private values: number[] = [];
  public add(value: number): number { this.values.push(value); return this.values.length; }
  public count(): number { return this.values.length; }
  public total(): number { let t = 0; for (let i = 0; i < this.values.length; i++) { t = t + this.values[i]; } return t; }
  public average(): number { if (this.values.length === 0) { return 0; } return this.total() / this.values.length; }
  public max(): number { let m = 0; for (let i = 0; i < this.values.length; i++) { if (this.values[i] > m) { m = this.values[i]; } } return m; }
  public clear(): void { this.values = []; }
}

class AnimationControllerValidationRouteNameValidator31 {
  public isBuilderName(name: string): boolean { return name.endsWith('_Builder'); }
  public isRouterName(name: string): boolean { return name.length > 0 && name.endsWith('_Router'); }
  public isPageTitle(title: string): boolean { return title.startsWith('HarA_') || title.startsWith('HarB_'); }
  public isButtonLabel(label: string): boolean { return label.startsWith('To'); }
  public isNonEmpty(text: string): boolean { return text.length > 0; }
}

class AnimationControllerValidationRouteScenario32 {
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

interface AnimationControllerValidationRouteUrlParser33Route {
  harName: string;
  path: string;
  routerName: string;
  builderName: string;
}
class AnimationControllerValidationRouteUrlParser33 {
  public static parse(url: string): AnimationControllerValidationRouteUrlParser33Route {
    const parts: string[] = url.split('/');
    const harName: string = parts[0];
    const ctx: string[] = parts[parts.length - 1].split('-');
    const routerName: string = ctx[0];
    const builderName: string = ctx.length > 1 ? ctx[1] : '';
    let path: string = '.';
    for (let i = 1; i < parts.length - 1; i++) { path = path + '/' + parts[i]; }
    const route: AnimationControllerValidationRouteUrlParser33Route = { harName: harName, path: path, routerName: routerName, builderName: builderName };
    return route;
  }
  public static harOf(url: string): string { const parts: string[] = url.split('/'); return parts[0]; }
  public static builderOf(url: string): string { const parts: string[] = url.split('/'); const ctx: string[] = parts[parts.length - 1].split('-'); return ctx.length > 1 ? ctx[1] : ''; }
}

class AnimationControllerValidationBuilderRegistry34 {
  private items: Map<string, string> = new Map<string, string>();
  public register(name: string, har: string): number { this.items.set(name, har); return this.items.size; }
  public resolve(name: string): string { const v = this.items.get(name); return v === undefined ? '' : v; }
  public has(name: string): boolean { return this.items.has(name); }
  public remove(name: string): boolean { return this.items.delete(name); }
  public size(): number { return this.items.size; }
  public names(): string[] { const r: string[] = []; this.items.forEach((v: string, k: string) => { r.push(k); }); return r; }
  public clear(): void { this.items = new Map<string, string>(); }
}

class AnimationControllerValidationNavStackModel35 {
  private stack: string[] = [];
  public push(page: string): number { this.stack.push(page); return this.stack.length; }
  public pop(): string { const v = this.stack.pop(); return v === undefined ? '' : v; }
  public clear(): void { this.stack = []; }
  public depth(): number { return this.stack.length; }
  public top(): string { if (this.stack.length === 0) { return ''; } return this.stack[this.stack.length - 1]; }
  public contains(page: string): boolean { for (let i = 0; i < this.stack.length; i++) { if (this.stack[i] === page) { return true; } } return false; }
}

class AnimationControllerValidationHarInitResolver36 {
  public resolve(path: string): string {
    if (path === './src/main/ets/components/mainpage/page1') { return 'page1'; }
    if (path === './src/main/ets/components/mainpage/page2') { return 'page2'; }
    if (path === './src/main/ets/components/mainpage/page3') { return 'page3'; }
    return '';
  }
  public isKnown(path: string): boolean { return this.resolve(path) !== ''; }
  public importPath(path: string): string { const page: string = this.resolve(path); return page === '' ? '' : path + '.ets'; }
}

class AnimationControllerValidationPageCatalog37 {
  private titles: string[] = ['HarA_Page1', 'HarA_Page2', 'HarA_Page3', 'HarB_Page1', 'HarB_Page2', 'HarB_Page3'];
  private buttons: string[] = ['ToHarAPage1', 'ToHarAPage2', 'ToHarAPage3', 'ToHarBPage1', 'ToHarBPage2', 'ToHarBPage3'];
  public titleCount(): number { return this.titles.length; }
  public buttonCount(): number { return this.buttons.length; }
  public titleAt(index: number): string { if (index < 0 || index >= this.titles.length) { return ''; } return this.titles[index]; }
  public buttonAt(index: number): string { if (index < 0 || index >= this.buttons.length) { return ''; } return this.buttons[index]; }
  public containsTitle(title: string): boolean { for (let i = 0; i < this.titles.length; i++) { if (this.titles[i] === title) { return true; } } return false; }
}

class AnimationControllerValidationRouteStats38 {
  private values: number[] = [];
  public add(value: number): number { this.values.push(value); return this.values.length; }
  public count(): number { return this.values.length; }
  public total(): number { let t = 0; for (let i = 0; i < this.values.length; i++) { t = t + this.values[i]; } return t; }
  public average(): number { if (this.values.length === 0) { return 0; } return this.total() / this.values.length; }
  public max(): number { let m = 0; for (let i = 0; i < this.values.length; i++) { if (this.values[i] > m) { m = this.values[i]; } } return m; }
  public clear(): void { this.values = []; }
}

class AnimationControllerValidationRouteNameValidator39 {
  public isBuilderName(name: string): boolean { return name.endsWith('_Builder'); }
  public isRouterName(name: string): boolean { return name.length > 0 && name.endsWith('_Router'); }
  public isPageTitle(title: string): boolean { return title.startsWith('HarA_') || title.startsWith('HarB_'); }
  public isButtonLabel(label: string): boolean { return label.startsWith('To'); }
  public isNonEmpty(text: string): boolean { return text.length > 0; }
}

class AnimationControllerValidationRouteScenario40 {
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

interface AnimationControllerValidationRouteUrlParser41Route {
  harName: string;
  path: string;
  routerName: string;
  builderName: string;
}
class AnimationControllerValidationRouteUrlParser41 {
  public static parse(url: string): AnimationControllerValidationRouteUrlParser41Route {
    const parts: string[] = url.split('/');
    const harName: string = parts[0];
    const ctx: string[] = parts[parts.length - 1].split('-');
    const routerName: string = ctx[0];
    const builderName: string = ctx.length > 1 ? ctx[1] : '';
    let path: string = '.';
    for (let i = 1; i < parts.length - 1; i++) { path = path + '/' + parts[i]; }
    const route: AnimationControllerValidationRouteUrlParser41Route = { harName: harName, path: path, routerName: routerName, builderName: builderName };
    return route;
  }
  public static harOf(url: string): string { const parts: string[] = url.split('/'); return parts[0]; }
  public static builderOf(url: string): string { const parts: string[] = url.split('/'); const ctx: string[] = parts[parts.length - 1].split('-'); return ctx.length > 1 ? ctx[1] : ''; }
}

class AnimationControllerValidationBuilderRegistry42 {
  private items: Map<string, string> = new Map<string, string>();
  public register(name: string, har: string): number { this.items.set(name, har); return this.items.size; }
  public resolve(name: string): string { const v = this.items.get(name); return v === undefined ? '' : v; }
  public has(name: string): boolean { return this.items.has(name); }
  public remove(name: string): boolean { return this.items.delete(name); }
  public size(): number { return this.items.size; }
  public names(): string[] { const r: string[] = []; this.items.forEach((v: string, k: string) => { r.push(k); }); return r; }
  public clear(): void { this.items = new Map<string, string>(); }
}

class AnimationControllerValidationNavStackModel43 {
  private stack: string[] = [];
  public push(page: string): number { this.stack.push(page); return this.stack.length; }
  public pop(): string { const v = this.stack.pop(); return v === undefined ? '' : v; }
  public clear(): void { this.stack = []; }
  public depth(): number { return this.stack.length; }
  public top(): string { if (this.stack.length === 0) { return ''; } return this.stack[this.stack.length - 1]; }
  public contains(page: string): boolean { for (let i = 0; i < this.stack.length; i++) { if (this.stack[i] === page) { return true; } } return false; }
}

class AnimationControllerValidationHarInitResolver44 {
  public resolve(path: string): string {
    if (path === './src/main/ets/components/mainpage/page1') { return 'page1'; }
    if (path === './src/main/ets/components/mainpage/page2') { return 'page2'; }
    if (path === './src/main/ets/components/mainpage/page3') { return 'page3'; }
    return '';
  }
  public isKnown(path: string): boolean { return this.resolve(path) !== ''; }
  public importPath(path: string): string { const page: string = this.resolve(path); return page === '' ? '' : path + '.ets'; }
}

class AnimationControllerValidationPageCatalog45 {
  private titles: string[] = ['HarA_Page1', 'HarA_Page2', 'HarA_Page3', 'HarB_Page1', 'HarB_Page2', 'HarB_Page3'];
  private buttons: string[] = ['ToHarAPage1', 'ToHarAPage2', 'ToHarAPage3', 'ToHarBPage1', 'ToHarBPage2', 'ToHarBPage3'];
  public titleCount(): number { return this.titles.length; }
  public buttonCount(): number { return this.buttons.length; }
  public titleAt(index: number): string { if (index < 0 || index >= this.titles.length) { return ''; } return this.titles[index]; }
  public buttonAt(index: number): string { if (index < 0 || index >= this.buttons.length) { return ''; } return this.buttons[index]; }
  public containsTitle(title: string): boolean { for (let i = 0; i < this.titles.length; i++) { if (this.titles[i] === title) { return true; } } return false; }
}

class AnimationControllerValidationRouteStats46 {
  private values: number[] = [];
  public add(value: number): number { this.values.push(value); return this.values.length; }
  public count(): number { return this.values.length; }
  public total(): number { let t = 0; for (let i = 0; i < this.values.length; i++) { t = t + this.values[i]; } return t; }
  public average(): number { if (this.values.length === 0) { return 0; } return this.total() / this.values.length; }
  public max(): number { let m = 0; for (let i = 0; i < this.values.length; i++) { if (this.values[i] > m) { m = this.values[i]; } } return m; }
  public clear(): void { this.values = []; }
}

class AnimationControllerValidationRouteNameValidator47 {
  public isBuilderName(name: string): boolean { return name.endsWith('_Builder'); }
  public isRouterName(name: string): boolean { return name.length > 0 && name.endsWith('_Router'); }
  public isPageTitle(title: string): boolean { return title.startsWith('HarA_') || title.startsWith('HarB_'); }
  public isButtonLabel(label: string): boolean { return label.startsWith('To'); }
  public isNonEmpty(text: string): boolean { return text.length > 0; }
}

class AnimationControllerValidationRouteScenario48 {
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

interface AnimationControllerValidationRouteUrlParser49Route {
  harName: string;
  path: string;
  routerName: string;
  builderName: string;
}
class AnimationControllerValidationRouteUrlParser49 {
  public static parse(url: string): AnimationControllerValidationRouteUrlParser49Route {
    const parts: string[] = url.split('/');
    const harName: string = parts[0];
    const ctx: string[] = parts[parts.length - 1].split('-');
    const routerName: string = ctx[0];
    const builderName: string = ctx.length > 1 ? ctx[1] : '';
    let path: string = '.';
    for (let i = 1; i < parts.length - 1; i++) { path = path + '/' + parts[i]; }
    const route: AnimationControllerValidationRouteUrlParser49Route = { harName: harName, path: path, routerName: routerName, builderName: builderName };
    return route;
  }
  public static harOf(url: string): string { const parts: string[] = url.split('/'); return parts[0]; }
  public static builderOf(url: string): string { const parts: string[] = url.split('/'); const ctx: string[] = parts[parts.length - 1].split('-'); return ctx.length > 1 ? ctx[1] : ''; }
}

class AnimationControllerValidationBuilderRegistry50 {
  private items: Map<string, string> = new Map<string, string>();
  public register(name: string, har: string): number { this.items.set(name, har); return this.items.size; }
  public resolve(name: string): string { const v = this.items.get(name); return v === undefined ? '' : v; }
  public has(name: string): boolean { return this.items.has(name); }
  public remove(name: string): boolean { return this.items.delete(name); }
  public size(): number { return this.items.size; }
  public names(): string[] { const r: string[] = []; this.items.forEach((v: string, k: string) => { r.push(k); }); return r; }
  public clear(): void { this.items = new Map<string, string>(); }
}

class AnimationControllerValidationNavStackModel51 {
  private stack: string[] = [];
  public push(page: string): number { this.stack.push(page); return this.stack.length; }
  public pop(): string { const v = this.stack.pop(); return v === undefined ? '' : v; }
  public clear(): void { this.stack = []; }
  public depth(): number { return this.stack.length; }
  public top(): string { if (this.stack.length === 0) { return ''; } return this.stack[this.stack.length - 1]; }
  public contains(page: string): boolean { for (let i = 0; i < this.stack.length; i++) { if (this.stack[i] === page) { return true; } } return false; }
}

class AnimationControllerValidationHarInitResolver52 {
  public resolve(path: string): string {
    if (path === './src/main/ets/components/mainpage/page1') { return 'page1'; }
    if (path === './src/main/ets/components/mainpage/page2') { return 'page2'; }
    if (path === './src/main/ets/components/mainpage/page3') { return 'page3'; }
    return '';
  }
  public isKnown(path: string): boolean { return this.resolve(path) !== ''; }
  public importPath(path: string): string { const page: string = this.resolve(path); return page === '' ? '' : path + '.ets'; }
}

class AnimationControllerValidationPageCatalog53 {
  private titles: string[] = ['HarA_Page1', 'HarA_Page2', 'HarA_Page3', 'HarB_Page1', 'HarB_Page2', 'HarB_Page3'];
  private buttons: string[] = ['ToHarAPage1', 'ToHarAPage2', 'ToHarAPage3', 'ToHarBPage1', 'ToHarBPage2', 'ToHarBPage3'];
  public titleCount(): number { return this.titles.length; }
  public buttonCount(): number { return this.buttons.length; }
  public titleAt(index: number): string { if (index < 0 || index >= this.titles.length) { return ''; } return this.titles[index]; }
  public buttonAt(index: number): string { if (index < 0 || index >= this.buttons.length) { return ''; } return this.buttons[index]; }
  public containsTitle(title: string): boolean { for (let i = 0; i < this.titles.length; i++) { if (this.titles[i] === title) { return true; } } return false; }
}

class AnimationControllerValidationRouteStats54 {
  private values: number[] = [];
  public add(value: number): number { this.values.push(value); return this.values.length; }
  public count(): number { return this.values.length; }
  public total(): number { let t = 0; for (let i = 0; i < this.values.length; i++) { t = t + this.values[i]; } return t; }
  public average(): number { if (this.values.length === 0) { return 0; } return this.total() / this.values.length; }
  public max(): number { let m = 0; for (let i = 0; i < this.values.length; i++) { if (this.values[i] > m) { m = this.values[i]; } } return m; }
  public clear(): void { this.values = []; }
}

class AnimationControllerValidationRouteNameValidator55 {
  public isBuilderName(name: string): boolean { return name.endsWith('_Builder'); }
  public isRouterName(name: string): boolean { return name.length > 0 && name.endsWith('_Router'); }
  public isPageTitle(title: string): boolean { return title.startsWith('HarA_') || title.startsWith('HarB_'); }
  public isButtonLabel(label: string): boolean { return label.startsWith('To'); }
  public isNonEmpty(text: string): boolean { return text.length > 0; }
}

class AnimationControllerValidationRouteScenario56 {
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

interface AnimationControllerValidationRouteUrlParser57Route {
  harName: string;
  path: string;
  routerName: string;
  builderName: string;
}
class AnimationControllerValidationRouteUrlParser57 {
  public static parse(url: string): AnimationControllerValidationRouteUrlParser57Route {
    const parts: string[] = url.split('/');
    const harName: string = parts[0];
    const ctx: string[] = parts[parts.length - 1].split('-');
    const routerName: string = ctx[0];
    const builderName: string = ctx.length > 1 ? ctx[1] : '';
    let path: string = '.';
    for (let i = 1; i < parts.length - 1; i++) { path = path + '/' + parts[i]; }
    const route: AnimationControllerValidationRouteUrlParser57Route = { harName: harName, path: path, routerName: routerName, builderName: builderName };
    return route;
  }
  public static harOf(url: string): string { const parts: string[] = url.split('/'); return parts[0]; }
  public static builderOf(url: string): string { const parts: string[] = url.split('/'); const ctx: string[] = parts[parts.length - 1].split('-'); return ctx.length > 1 ? ctx[1] : ''; }
}

class AnimationControllerValidationBuilderRegistry58 {
  private items: Map<string, string> = new Map<string, string>();
  public register(name: string, har: string): number { this.items.set(name, har); return this.items.size; }
  public resolve(name: string): string { const v = this.items.get(name); return v === undefined ? '' : v; }
  public has(name: string): boolean { return this.items.has(name); }
  public remove(name: string): boolean { return this.items.delete(name); }
  public size(): number { return this.items.size; }
  public names(): string[] { const r: string[] = []; this.items.forEach((v: string, k: string) => { r.push(k); }); return r; }
  public clear(): void { this.items = new Map<string, string>(); }
}

class AnimationControllerValidationNavStackModel59 {
  private stack: string[] = [];
  public push(page: string): number { this.stack.push(page); return this.stack.length; }
  public pop(): string { const v = this.stack.pop(); return v === undefined ? '' : v; }
  public clear(): void { this.stack = []; }
  public depth(): number { return this.stack.length; }
  public top(): string { if (this.stack.length === 0) { return ''; } return this.stack[this.stack.length - 1]; }
  public contains(page: string): boolean { for (let i = 0; i < this.stack.length; i++) { if (this.stack[i] === page) { return true; } } return false; }
}

class AnimationControllerValidationHarInitResolver60 {
  public resolve(path: string): string {
    if (path === './src/main/ets/components/mainpage/page1') { return 'page1'; }
    if (path === './src/main/ets/components/mainpage/page2') { return 'page2'; }
    if (path === './src/main/ets/components/mainpage/page3') { return 'page3'; }
    return '';
  }
  public isKnown(path: string): boolean { return this.resolve(path) !== ''; }
  public importPath(path: string): string { const page: string = this.resolve(path); return page === '' ? '' : path + '.ets'; }
}

class AnimationControllerValidationPageCatalog61 {
  private titles: string[] = ['HarA_Page1', 'HarA_Page2', 'HarA_Page3', 'HarB_Page1', 'HarB_Page2', 'HarB_Page3'];
  private buttons: string[] = ['ToHarAPage1', 'ToHarAPage2', 'ToHarAPage3', 'ToHarBPage1', 'ToHarBPage2', 'ToHarBPage3'];
  public titleCount(): number { return this.titles.length; }
  public buttonCount(): number { return this.buttons.length; }
  public titleAt(index: number): string { if (index < 0 || index >= this.titles.length) { return ''; } return this.titles[index]; }
  public buttonAt(index: number): string { if (index < 0 || index >= this.buttons.length) { return ''; } return this.buttons[index]; }
  public containsTitle(title: string): boolean { for (let i = 0; i < this.titles.length; i++) { if (this.titles[i] === title) { return true; } } return false; }
}

class AnimationControllerValidationRouteStats62 {
  private values: number[] = [];
  public add(value: number): number { this.values.push(value); return this.values.length; }
  public count(): number { return this.values.length; }
  public total(): number { let t = 0; for (let i = 0; i < this.values.length; i++) { t = t + this.values[i]; } return t; }
  public average(): number { if (this.values.length === 0) { return 0; } return this.total() / this.values.length; }
  public max(): number { let m = 0; for (let i = 0; i < this.values.length; i++) { if (this.values[i] > m) { m = this.values[i]; } } return m; }
  public clear(): void { this.values = []; }
}


export default function validationAnimationControllerValidationTest() {
  describe('Validation_AnimationControllerValidation_Test', () => {
    beforeAll(async () => {
    });
    afterAll(async () => {
    });
    it('router_case_0', 0, async () => {
      const s = new AnimationControllerValidationRouteScenario0();
      s.registerBuilder('HarA_Page1_Builder', 'HarA');
      s.createRouter('HapA_Router');
      for (let n = 0; n < 1; n++) { s.addToStack('HapA_Router', 'page' + n); }
      expect(s.countBuilders()).assertEqual(1);
      expect(s.depth('HapA_Router')).assertEqual(1);
      expect(s.getBuilder('HarA_Page1_Builder')).assertEqual('HarA');
      expect(s.top('HapA_Router')).assertEqual('page' + (1 - 1));
    });
    it('router_case_1', 0, async () => {
      const s = new AnimationControllerValidationRouteScenario0();
      s.registerBuilder('HarA_Page2_Builder', 'HarA');
      s.createRouter('HapA_Router');
      for (let n = 0; n < 2; n++) { s.addToStack('HapA_Router', 'page' + n); }
      expect(s.countBuilders()).assertEqual(1);
      expect(s.depth('HapA_Router')).assertEqual(2);
      expect(s.getBuilder('HarA_Page2_Builder')).assertEqual('HarA');
      expect(s.top('HapA_Router')).assertEqual('page' + (2 - 1));
    });
    it('router_case_2', 0, async () => {
      const s = new AnimationControllerValidationRouteScenario0();
      s.registerBuilder('HarA_Page3_Builder', 'HarA');
      s.createRouter('HapA_Router');
      for (let n = 0; n < 3; n++) { s.addToStack('HapA_Router', 'page' + n); }
      expect(s.countBuilders()).assertEqual(1);
      expect(s.depth('HapA_Router')).assertEqual(3);
      expect(s.getBuilder('HarA_Page3_Builder')).assertEqual('HarA');
      expect(s.top('HapA_Router')).assertEqual('page' + (3 - 1));
    });
    it('router_case_3', 0, async () => {
      const s = new AnimationControllerValidationRouteScenario0();
      s.registerBuilder('HarA_Page4_Builder', 'HarA');
      s.createRouter('HapA_Router');
      for (let n = 0; n < 4; n++) { s.addToStack('HapA_Router', 'page' + n); }
      expect(s.countBuilders()).assertEqual(1);
      expect(s.depth('HapA_Router')).assertEqual(4);
      expect(s.getBuilder('HarA_Page4_Builder')).assertEqual('HarA');
      expect(s.top('HapA_Router')).assertEqual('page' + (4 - 1));
    });
    it('router_case_4', 0, async () => {
      const s = new AnimationControllerValidationRouteScenario0();
      s.registerBuilder('HarA_Page5_Builder', 'HarA');
      s.createRouter('HapA_Router');
      for (let n = 0; n < 5; n++) { s.addToStack('HapA_Router', 'page' + n); }
      expect(s.countBuilders()).assertEqual(1);
      expect(s.depth('HapA_Router')).assertEqual(5);
      expect(s.getBuilder('HarA_Page5_Builder')).assertEqual('HarA');
      expect(s.top('HapA_Router')).assertEqual('page' + (5 - 1));
    });
    it('router_case_5', 0, async () => {
      const s = new AnimationControllerValidationRouteScenario0();
      s.registerBuilder('HarA_Page1_Builder', 'HarA');
      s.createRouter('HapA_Router');
      for (let n = 0; n < 1; n++) { s.addToStack('HapA_Router', 'page' + n); }
      expect(s.countBuilders()).assertEqual(1);
      expect(s.depth('HapA_Router')).assertEqual(1);
      expect(s.getBuilder('HarA_Page1_Builder')).assertEqual('HarA');
      expect(s.top('HapA_Router')).assertEqual('page' + (1 - 1));
    });
    it('router_case_6', 0, async () => {
      const s = new AnimationControllerValidationRouteScenario0();
      s.registerBuilder('HarA_Page2_Builder', 'HarA');
      s.createRouter('HapA_Router');
      for (let n = 0; n < 2; n++) { s.addToStack('HapA_Router', 'page' + n); }
      expect(s.countBuilders()).assertEqual(1);
      expect(s.depth('HapA_Router')).assertEqual(2);
      expect(s.getBuilder('HarA_Page2_Builder')).assertEqual('HarA');
      expect(s.top('HapA_Router')).assertEqual('page' + (2 - 1));
    });
    it('router_case_7', 0, async () => {
      const s = new AnimationControllerValidationRouteScenario0();
      s.registerBuilder('HarA_Page3_Builder', 'HarA');
      s.createRouter('HapA_Router');
      for (let n = 0; n < 3; n++) { s.addToStack('HapA_Router', 'page' + n); }
      expect(s.countBuilders()).assertEqual(1);
      expect(s.depth('HapA_Router')).assertEqual(3);
      expect(s.getBuilder('HarA_Page3_Builder')).assertEqual('HarA');
      expect(s.top('HapA_Router')).assertEqual('page' + (3 - 1));
    });
    it('router_case_8', 0, async () => {
      const s = new AnimationControllerValidationRouteScenario0();
      s.registerBuilder('HarA_Page4_Builder', 'HarA');
      s.createRouter('HapA_Router');
      for (let n = 0; n < 4; n++) { s.addToStack('HapA_Router', 'page' + n); }
      expect(s.countBuilders()).assertEqual(1);
      expect(s.depth('HapA_Router')).assertEqual(4);
      expect(s.getBuilder('HarA_Page4_Builder')).assertEqual('HarA');
      expect(s.top('HapA_Router')).assertEqual('page' + (4 - 1));
    });
    it('router_case_9', 0, async () => {
      const s = new AnimationControllerValidationRouteScenario0();
      s.registerBuilder('HarA_Page5_Builder', 'HarA');
      s.createRouter('HapA_Router');
      for (let n = 0; n < 5; n++) { s.addToStack('HapA_Router', 'page' + n); }
      expect(s.countBuilders()).assertEqual(1);
      expect(s.depth('HapA_Router')).assertEqual(5);
      expect(s.getBuilder('HarA_Page5_Builder')).assertEqual('HarA');
      expect(s.top('HapA_Router')).assertEqual('page' + (5 - 1));
    });
    it('router_case_10', 0, async () => {
      const s = new AnimationControllerValidationRouteScenario0();
      s.registerBuilder('HarA_Page1_Builder', 'HarA');
      s.createRouter('HapA_Router');
      for (let n = 0; n < 1; n++) { s.addToStack('HapA_Router', 'page' + n); }
      expect(s.countBuilders()).assertEqual(1);
      expect(s.depth('HapA_Router')).assertEqual(1);
      expect(s.getBuilder('HarA_Page1_Builder')).assertEqual('HarA');
      expect(s.top('HapA_Router')).assertEqual('page' + (1 - 1));
    });
    it('router_case_11', 0, async () => {
      const s = new AnimationControllerValidationRouteScenario0();
      s.registerBuilder('HarA_Page2_Builder', 'HarA');
      s.createRouter('HapA_Router');
      for (let n = 0; n < 2; n++) { s.addToStack('HapA_Router', 'page' + n); }
      expect(s.countBuilders()).assertEqual(1);
      expect(s.depth('HapA_Router')).assertEqual(2);
      expect(s.getBuilder('HarA_Page2_Builder')).assertEqual('HarA');
      expect(s.top('HapA_Router')).assertEqual('page' + (2 - 1));
    });
    it('router_case_12', 0, async () => {
      const s = new AnimationControllerValidationRouteScenario0();
      s.registerBuilder('HarA_Page3_Builder', 'HarA');
      s.createRouter('HapA_Router');
      for (let n = 0; n < 3; n++) { s.addToStack('HapA_Router', 'page' + n); }
      expect(s.countBuilders()).assertEqual(1);
      expect(s.depth('HapA_Router')).assertEqual(3);
      expect(s.getBuilder('HarA_Page3_Builder')).assertEqual('HarA');
      expect(s.top('HapA_Router')).assertEqual('page' + (3 - 1));
    });
    it('router_case_13', 0, async () => {
      const s = new AnimationControllerValidationRouteScenario0();
      s.registerBuilder('HarA_Page4_Builder', 'HarA');
      s.createRouter('HapA_Router');
      for (let n = 0; n < 4; n++) { s.addToStack('HapA_Router', 'page' + n); }
      expect(s.countBuilders()).assertEqual(1);
      expect(s.depth('HapA_Router')).assertEqual(4);
      expect(s.getBuilder('HarA_Page4_Builder')).assertEqual('HarA');
      expect(s.top('HapA_Router')).assertEqual('page' + (4 - 1));
    });
    it('router_case_14', 0, async () => {
      const s = new AnimationControllerValidationRouteScenario0();
      s.registerBuilder('HarA_Page5_Builder', 'HarA');
      s.createRouter('HapA_Router');
      for (let n = 0; n < 5; n++) { s.addToStack('HapA_Router', 'page' + n); }
      expect(s.countBuilders()).assertEqual(1);
      expect(s.depth('HapA_Router')).assertEqual(5);
      expect(s.getBuilder('HarA_Page5_Builder')).assertEqual('HarA');
      expect(s.top('HapA_Router')).assertEqual('page' + (5 - 1));
    });
    it('router_case_15', 0, async () => {
      const s = new AnimationControllerValidationRouteScenario0();
      s.registerBuilder('HarA_Page1_Builder', 'HarA');
      s.createRouter('HapA_Router');
      for (let n = 0; n < 1; n++) { s.addToStack('HapA_Router', 'page' + n); }
      expect(s.countBuilders()).assertEqual(1);
      expect(s.depth('HapA_Router')).assertEqual(1);
      expect(s.getBuilder('HarA_Page1_Builder')).assertEqual('HarA');
      expect(s.top('HapA_Router')).assertEqual('page' + (1 - 1));
    });
    it('router_case_16', 0, async () => {
      const s = new AnimationControllerValidationRouteScenario0();
      s.registerBuilder('HarA_Page2_Builder', 'HarA');
      s.createRouter('HapA_Router');
      for (let n = 0; n < 2; n++) { s.addToStack('HapA_Router', 'page' + n); }
      expect(s.countBuilders()).assertEqual(1);
      expect(s.depth('HapA_Router')).assertEqual(2);
      expect(s.getBuilder('HarA_Page2_Builder')).assertEqual('HarA');
      expect(s.top('HapA_Router')).assertEqual('page' + (2 - 1));
    });
    it('router_case_17', 0, async () => {
      const s = new AnimationControllerValidationRouteScenario0();
      s.registerBuilder('HarA_Page3_Builder', 'HarA');
      s.createRouter('HapA_Router');
      for (let n = 0; n < 3; n++) { s.addToStack('HapA_Router', 'page' + n); }
      expect(s.countBuilders()).assertEqual(1);
      expect(s.depth('HapA_Router')).assertEqual(3);
      expect(s.getBuilder('HarA_Page3_Builder')).assertEqual('HarA');
      expect(s.top('HapA_Router')).assertEqual('page' + (3 - 1));
    });
    it('router_case_18', 0, async () => {
      const s = new AnimationControllerValidationRouteScenario0();
      s.registerBuilder('HarA_Page4_Builder', 'HarA');
      s.createRouter('HapA_Router');
      for (let n = 0; n < 4; n++) { s.addToStack('HapA_Router', 'page' + n); }
      expect(s.countBuilders()).assertEqual(1);
      expect(s.depth('HapA_Router')).assertEqual(4);
      expect(s.getBuilder('HarA_Page4_Builder')).assertEqual('HarA');
      expect(s.top('HapA_Router')).assertEqual('page' + (4 - 1));
    });
    it('router_case_19', 0, async () => {
      const s = new AnimationControllerValidationRouteScenario0();
      s.registerBuilder('HarA_Page5_Builder', 'HarA');
      s.createRouter('HapA_Router');
      for (let n = 0; n < 5; n++) { s.addToStack('HapA_Router', 'page' + n); }
      expect(s.countBuilders()).assertEqual(1);
      expect(s.depth('HapA_Router')).assertEqual(5);
      expect(s.getBuilder('HarA_Page5_Builder')).assertEqual('HarA');
      expect(s.top('HapA_Router')).assertEqual('page' + (5 - 1));
    });
    it('router_case_20', 0, async () => {
      const s = new AnimationControllerValidationRouteScenario0();
      s.registerBuilder('HarA_Page1_Builder', 'HarA');
      s.createRouter('HapA_Router');
      for (let n = 0; n < 1; n++) { s.addToStack('HapA_Router', 'page' + n); }
      expect(s.countBuilders()).assertEqual(1);
      expect(s.depth('HapA_Router')).assertEqual(1);
      expect(s.getBuilder('HarA_Page1_Builder')).assertEqual('HarA');
      expect(s.top('HapA_Router')).assertEqual('page' + (1 - 1));
    });
    it('router_case_21', 0, async () => {
      const s = new AnimationControllerValidationRouteScenario0();
      s.registerBuilder('HarA_Page2_Builder', 'HarA');
      s.createRouter('HapA_Router');
      for (let n = 0; n < 2; n++) { s.addToStack('HapA_Router', 'page' + n); }
      expect(s.countBuilders()).assertEqual(1);
      expect(s.depth('HapA_Router')).assertEqual(2);
      expect(s.getBuilder('HarA_Page2_Builder')).assertEqual('HarA');
      expect(s.top('HapA_Router')).assertEqual('page' + (2 - 1));
    });
    it('router_case_22', 0, async () => {
      const s = new AnimationControllerValidationRouteScenario0();
      s.registerBuilder('HarA_Page3_Builder', 'HarA');
      s.createRouter('HapA_Router');
      for (let n = 0; n < 3; n++) { s.addToStack('HapA_Router', 'page' + n); }
      expect(s.countBuilders()).assertEqual(1);
      expect(s.depth('HapA_Router')).assertEqual(3);
      expect(s.getBuilder('HarA_Page3_Builder')).assertEqual('HarA');
      expect(s.top('HapA_Router')).assertEqual('page' + (3 - 1));
    });
    it('router_case_23', 0, async () => {
      const s = new AnimationControllerValidationRouteScenario0();
      s.registerBuilder('HarA_Page4_Builder', 'HarA');
      s.createRouter('HapA_Router');
      for (let n = 0; n < 4; n++) { s.addToStack('HapA_Router', 'page' + n); }
      expect(s.countBuilders()).assertEqual(1);
      expect(s.depth('HapA_Router')).assertEqual(4);
      expect(s.getBuilder('HarA_Page4_Builder')).assertEqual('HarA');
      expect(s.top('HapA_Router')).assertEqual('page' + (4 - 1));
    });
    it('router_case_24', 0, async () => {
      const s = new AnimationControllerValidationRouteScenario0();
      s.registerBuilder('HarA_Page5_Builder', 'HarA');
      s.createRouter('HapA_Router');
      for (let n = 0; n < 5; n++) { s.addToStack('HapA_Router', 'page' + n); }
      expect(s.countBuilders()).assertEqual(1);
      expect(s.depth('HapA_Router')).assertEqual(5);
      expect(s.getBuilder('HarA_Page5_Builder')).assertEqual('HarA');
      expect(s.top('HapA_Router')).assertEqual('page' + (5 - 1));
    });
    it('router_case_25', 0, async () => {
      const s = new AnimationControllerValidationRouteScenario0();
      s.registerBuilder('HarA_Page1_Builder', 'HarA');
      s.createRouter('HapA_Router');
      for (let n = 0; n < 1; n++) { s.addToStack('HapA_Router', 'page' + n); }
      expect(s.countBuilders()).assertEqual(1);
      expect(s.depth('HapA_Router')).assertEqual(1);
      expect(s.getBuilder('HarA_Page1_Builder')).assertEqual('HarA');
      expect(s.top('HapA_Router')).assertEqual('page' + (1 - 1));
    });
    it('router_case_26', 0, async () => {
      const s = new AnimationControllerValidationRouteScenario0();
      s.registerBuilder('HarA_Page2_Builder', 'HarA');
      s.createRouter('HapA_Router');
      for (let n = 0; n < 2; n++) { s.addToStack('HapA_Router', 'page' + n); }
      expect(s.countBuilders()).assertEqual(1);
      expect(s.depth('HapA_Router')).assertEqual(2);
      expect(s.getBuilder('HarA_Page2_Builder')).assertEqual('HarA');
      expect(s.top('HapA_Router')).assertEqual('page' + (2 - 1));
    });
    it('router_case_27', 0, async () => {
      const s = new AnimationControllerValidationRouteScenario0();
      s.registerBuilder('HarA_Page3_Builder', 'HarA');
      s.createRouter('HapA_Router');
      for (let n = 0; n < 3; n++) { s.addToStack('HapA_Router', 'page' + n); }
      expect(s.countBuilders()).assertEqual(1);
      expect(s.depth('HapA_Router')).assertEqual(3);
      expect(s.getBuilder('HarA_Page3_Builder')).assertEqual('HarA');
      expect(s.top('HapA_Router')).assertEqual('page' + (3 - 1));
    });
    it('router_case_28', 0, async () => {
      const s = new AnimationControllerValidationRouteScenario0();
      s.registerBuilder('HarA_Page4_Builder', 'HarA');
      s.createRouter('HapA_Router');
      for (let n = 0; n < 4; n++) { s.addToStack('HapA_Router', 'page' + n); }
      expect(s.countBuilders()).assertEqual(1);
      expect(s.depth('HapA_Router')).assertEqual(4);
      expect(s.getBuilder('HarA_Page4_Builder')).assertEqual('HarA');
      expect(s.top('HapA_Router')).assertEqual('page' + (4 - 1));
    });
    it('router_case_29', 0, async () => {
      const s = new AnimationControllerValidationRouteScenario0();
      s.registerBuilder('HarA_Page5_Builder', 'HarA');
      s.createRouter('HapA_Router');
      for (let n = 0; n < 5; n++) { s.addToStack('HapA_Router', 'page' + n); }
      expect(s.countBuilders()).assertEqual(1);
      expect(s.depth('HapA_Router')).assertEqual(5);
      expect(s.getBuilder('HarA_Page5_Builder')).assertEqual('HarA');
      expect(s.top('HapA_Router')).assertEqual('page' + (5 - 1));
    });
    it('router_case_30', 0, async () => {
      const s = new AnimationControllerValidationRouteScenario0();
      s.registerBuilder('HarA_Page1_Builder', 'HarA');
      s.createRouter('HapA_Router');
      for (let n = 0; n < 1; n++) { s.addToStack('HapA_Router', 'page' + n); }
      expect(s.countBuilders()).assertEqual(1);
      expect(s.depth('HapA_Router')).assertEqual(1);
      expect(s.getBuilder('HarA_Page1_Builder')).assertEqual('HarA');
      expect(s.top('HapA_Router')).assertEqual('page' + (1 - 1));
    });
    it('router_case_31', 0, async () => {
      const s = new AnimationControllerValidationRouteScenario0();
      s.registerBuilder('HarA_Page2_Builder', 'HarA');
      s.createRouter('HapA_Router');
      for (let n = 0; n < 2; n++) { s.addToStack('HapA_Router', 'page' + n); }
      expect(s.countBuilders()).assertEqual(1);
      expect(s.depth('HapA_Router')).assertEqual(2);
      expect(s.getBuilder('HarA_Page2_Builder')).assertEqual('HarA');
      expect(s.top('HapA_Router')).assertEqual('page' + (2 - 1));
    });
    it('router_case_32', 0, async () => {
      const s = new AnimationControllerValidationRouteScenario0();
      s.registerBuilder('HarA_Page3_Builder', 'HarA');
      s.createRouter('HapA_Router');
      for (let n = 0; n < 3; n++) { s.addToStack('HapA_Router', 'page' + n); }
      expect(s.countBuilders()).assertEqual(1);
      expect(s.depth('HapA_Router')).assertEqual(3);
      expect(s.getBuilder('HarA_Page3_Builder')).assertEqual('HarA');
      expect(s.top('HapA_Router')).assertEqual('page' + (3 - 1));
    });
    it('router_case_33', 0, async () => {
      const s = new AnimationControllerValidationRouteScenario0();
      s.registerBuilder('HarA_Page4_Builder', 'HarA');
      s.createRouter('HapA_Router');
      for (let n = 0; n < 4; n++) { s.addToStack('HapA_Router', 'page' + n); }
      expect(s.countBuilders()).assertEqual(1);
      expect(s.depth('HapA_Router')).assertEqual(4);
      expect(s.getBuilder('HarA_Page4_Builder')).assertEqual('HarA');
      expect(s.top('HapA_Router')).assertEqual('page' + (4 - 1));
    });
    it('router_case_34', 0, async () => {
      const s = new AnimationControllerValidationRouteScenario0();
      s.registerBuilder('HarA_Page5_Builder', 'HarA');
      s.createRouter('HapA_Router');
      for (let n = 0; n < 5; n++) { s.addToStack('HapA_Router', 'page' + n); }
      expect(s.countBuilders()).assertEqual(1);
      expect(s.depth('HapA_Router')).assertEqual(5);
      expect(s.getBuilder('HarA_Page5_Builder')).assertEqual('HarA');
      expect(s.top('HapA_Router')).assertEqual('page' + (5 - 1));
    });
    it('router_case_35', 0, async () => {
      const s = new AnimationControllerValidationRouteScenario0();
      s.registerBuilder('HarA_Page1_Builder', 'HarA');
      s.createRouter('HapA_Router');
      for (let n = 0; n < 1; n++) { s.addToStack('HapA_Router', 'page' + n); }
      expect(s.countBuilders()).assertEqual(1);
      expect(s.depth('HapA_Router')).assertEqual(1);
      expect(s.getBuilder('HarA_Page1_Builder')).assertEqual('HarA');
      expect(s.top('HapA_Router')).assertEqual('page' + (1 - 1));
    });
    it('router_case_36', 0, async () => {
      const s = new AnimationControllerValidationRouteScenario0();
      s.registerBuilder('HarA_Page2_Builder', 'HarA');
      s.createRouter('HapA_Router');
      for (let n = 0; n < 2; n++) { s.addToStack('HapA_Router', 'page' + n); }
      expect(s.countBuilders()).assertEqual(1);
      expect(s.depth('HapA_Router')).assertEqual(2);
      expect(s.getBuilder('HarA_Page2_Builder')).assertEqual('HarA');
      expect(s.top('HapA_Router')).assertEqual('page' + (2 - 1));
    });
    it('router_case_37', 0, async () => {
      const s = new AnimationControllerValidationRouteScenario0();
      s.registerBuilder('HarA_Page3_Builder', 'HarA');
      s.createRouter('HapA_Router');
      for (let n = 0; n < 3; n++) { s.addToStack('HapA_Router', 'page' + n); }
      expect(s.countBuilders()).assertEqual(1);
      expect(s.depth('HapA_Router')).assertEqual(3);
      expect(s.getBuilder('HarA_Page3_Builder')).assertEqual('HarA');
      expect(s.top('HapA_Router')).assertEqual('page' + (3 - 1));
    });
    it('router_case_38', 0, async () => {
      const s = new AnimationControllerValidationRouteScenario0();
      s.registerBuilder('HarA_Page4_Builder', 'HarA');
      s.createRouter('HapA_Router');
      for (let n = 0; n < 4; n++) { s.addToStack('HapA_Router', 'page' + n); }
      expect(s.countBuilders()).assertEqual(1);
      expect(s.depth('HapA_Router')).assertEqual(4);
      expect(s.getBuilder('HarA_Page4_Builder')).assertEqual('HarA');
      expect(s.top('HapA_Router')).assertEqual('page' + (4 - 1));
    });
    it('router_case_39', 0, async () => {
      const s = new AnimationControllerValidationRouteScenario0();
      s.registerBuilder('HarA_Page5_Builder', 'HarA');
      s.createRouter('HapA_Router');
      for (let n = 0; n < 5; n++) { s.addToStack('HapA_Router', 'page' + n); }
      expect(s.countBuilders()).assertEqual(1);
      expect(s.depth('HapA_Router')).assertEqual(5);
      expect(s.getBuilder('HarA_Page5_Builder')).assertEqual('HarA');
      expect(s.top('HapA_Router')).assertEqual('page' + (5 - 1));
    });
    it('router_case_40', 0, async () => {
      const s = new AnimationControllerValidationRouteScenario0();
      s.registerBuilder('HarA_Page1_Builder', 'HarA');
      s.createRouter('HapA_Router');
      for (let n = 0; n < 1; n++) { s.addToStack('HapA_Router', 'page' + n); }
      expect(s.countBuilders()).assertEqual(1);
      expect(s.depth('HapA_Router')).assertEqual(1);
      expect(s.getBuilder('HarA_Page1_Builder')).assertEqual('HarA');
      expect(s.top('HapA_Router')).assertEqual('page' + (1 - 1));
    });
    it('router_case_41', 0, async () => {
      const s = new AnimationControllerValidationRouteScenario0();
      s.registerBuilder('HarA_Page2_Builder', 'HarA');
      s.createRouter('HapA_Router');
      for (let n = 0; n < 2; n++) { s.addToStack('HapA_Router', 'page' + n); }
      expect(s.countBuilders()).assertEqual(1);
      expect(s.depth('HapA_Router')).assertEqual(2);
      expect(s.getBuilder('HarA_Page2_Builder')).assertEqual('HarA');
      expect(s.top('HapA_Router')).assertEqual('page' + (2 - 1));
    });
    it('router_case_42', 0, async () => {
      const s = new AnimationControllerValidationRouteScenario0();
      s.registerBuilder('HarA_Page3_Builder', 'HarA');
      s.createRouter('HapA_Router');
      for (let n = 0; n < 3; n++) { s.addToStack('HapA_Router', 'page' + n); }
      expect(s.countBuilders()).assertEqual(1);
      expect(s.depth('HapA_Router')).assertEqual(3);
      expect(s.getBuilder('HarA_Page3_Builder')).assertEqual('HarA');
      expect(s.top('HapA_Router')).assertEqual('page' + (3 - 1));
    });
    it('router_case_43', 0, async () => {
      const s = new AnimationControllerValidationRouteScenario0();
      s.registerBuilder('HarA_Page4_Builder', 'HarA');
      s.createRouter('HapA_Router');
      for (let n = 0; n < 4; n++) { s.addToStack('HapA_Router', 'page' + n); }
      expect(s.countBuilders()).assertEqual(1);
      expect(s.depth('HapA_Router')).assertEqual(4);
      expect(s.getBuilder('HarA_Page4_Builder')).assertEqual('HarA');
      expect(s.top('HapA_Router')).assertEqual('page' + (4 - 1));
    });
    it('router_case_44', 0, async () => {
      const s = new AnimationControllerValidationRouteScenario0();
      s.registerBuilder('HarA_Page5_Builder', 'HarA');
      s.createRouter('HapA_Router');
      for (let n = 0; n < 5; n++) { s.addToStack('HapA_Router', 'page' + n); }
      expect(s.countBuilders()).assertEqual(1);
      expect(s.depth('HapA_Router')).assertEqual(5);
      expect(s.getBuilder('HarA_Page5_Builder')).assertEqual('HarA');
      expect(s.top('HapA_Router')).assertEqual('page' + (5 - 1));
    });
    it('router_case_45', 0, async () => {
      const s = new AnimationControllerValidationRouteScenario0();
      s.registerBuilder('HarA_Page1_Builder', 'HarA');
      s.createRouter('HapA_Router');
      for (let n = 0; n < 1; n++) { s.addToStack('HapA_Router', 'page' + n); }
      expect(s.countBuilders()).assertEqual(1);
      expect(s.depth('HapA_Router')).assertEqual(1);
      expect(s.getBuilder('HarA_Page1_Builder')).assertEqual('HarA');
      expect(s.top('HapA_Router')).assertEqual('page' + (1 - 1));
    });
    it('router_case_46', 0, async () => {
      const s = new AnimationControllerValidationRouteScenario0();
      s.registerBuilder('HarA_Page2_Builder', 'HarA');
      s.createRouter('HapA_Router');
      for (let n = 0; n < 2; n++) { s.addToStack('HapA_Router', 'page' + n); }
      expect(s.countBuilders()).assertEqual(1);
      expect(s.depth('HapA_Router')).assertEqual(2);
      expect(s.getBuilder('HarA_Page2_Builder')).assertEqual('HarA');
      expect(s.top('HapA_Router')).assertEqual('page' + (2 - 1));
    });
    it('router_case_47', 0, async () => {
      const s = new AnimationControllerValidationRouteScenario0();
      s.registerBuilder('HarA_Page3_Builder', 'HarA');
      s.createRouter('HapA_Router');
      for (let n = 0; n < 3; n++) { s.addToStack('HapA_Router', 'page' + n); }
      expect(s.countBuilders()).assertEqual(1);
      expect(s.depth('HapA_Router')).assertEqual(3);
      expect(s.getBuilder('HarA_Page3_Builder')).assertEqual('HarA');
      expect(s.top('HapA_Router')).assertEqual('page' + (3 - 1));
    });
    it('router_case_48', 0, async () => {
      const s = new AnimationControllerValidationRouteScenario0();
      s.registerBuilder('HarA_Page4_Builder', 'HarA');
      s.createRouter('HapA_Router');
      for (let n = 0; n < 4; n++) { s.addToStack('HapA_Router', 'page' + n); }
      expect(s.countBuilders()).assertEqual(1);
      expect(s.depth('HapA_Router')).assertEqual(4);
      expect(s.getBuilder('HarA_Page4_Builder')).assertEqual('HarA');
      expect(s.top('HapA_Router')).assertEqual('page' + (4 - 1));
    });
    it('router_case_49', 0, async () => {
      const s = new AnimationControllerValidationRouteScenario0();
      s.registerBuilder('HarA_Page5_Builder', 'HarA');
      s.createRouter('HapA_Router');
      for (let n = 0; n < 5; n++) { s.addToStack('HapA_Router', 'page' + n); }
      expect(s.countBuilders()).assertEqual(1);
      expect(s.depth('HapA_Router')).assertEqual(5);
      expect(s.getBuilder('HarA_Page5_Builder')).assertEqual('HarA');
      expect(s.top('HapA_Router')).assertEqual('page' + (5 - 1));
    });
  });
}

