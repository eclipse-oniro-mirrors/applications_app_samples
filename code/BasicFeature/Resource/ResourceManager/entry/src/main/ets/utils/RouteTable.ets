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

/**
 * Single source of truth for the pages and the common event used by the sample,
 * so both the UI and the ohosTest suites address the same strings.
 */
export class RouteTable {
  /** Entry page of the sample. */
  static readonly PAGE_INDEX: string = 'pages/Index';
  /** Page that walks the resource APIs. */
  static readonly PAGE_BASIC_RESOURCES: string = 'pages/BasicResources';
  /** Page that drives the overlay module. */
  static readonly PAGE_OVERLAY: string = 'pages/Overlay';
  /** Common event published by the test to jump into BasicResources. */
  static readonly RESOURCES_EVENT: string = 'TestResourcesEvent';
  /** Prefix every router url of this sample starts with. */
  static readonly PAGE_PREFIX: string = 'pages/';

  private static readonly PAGES: string[] = [
    RouteTable.PAGE_INDEX,
    RouteTable.PAGE_BASIC_RESOURCES,
    RouteTable.PAGE_OVERLAY
  ];

  /** Declared pages in registration order. */
  static allPages(): string[] {
    const copy: string[] = [];
    for (let index: number = 0; index < RouteTable.PAGES.length; index++) {
      copy.push(RouteTable.PAGES[index]);
    }
    return copy;
  }

  /** Index of a declared page, -1 for anything else. */
  static pageIndexOf(url: string): number {
    return RouteTable.PAGES.indexOf(url);
  }

  /** True only for a declared page. */
  static isKnownPage(url: string): boolean {
    return RouteTable.pageIndexOf(url) !== -1;
  }

  /** Router url, unknown values fall back to the entry page. */
  static resolvePage(url: string): string {
    return RouteTable.isKnownPage(url) ? url : RouteTable.PAGE_INDEX;
  }

  /** True when the url carries the sample page prefix. */
  static isPageUrl(url: string): boolean {
    return !!url && url.startsWith(RouteTable.PAGE_PREFIX);
  }

  /** True when the event name is the one the test publishes. */
  static isResourcesEvent(event: string): boolean {
    return event === RouteTable.RESOURCES_EVENT;
  }
}
