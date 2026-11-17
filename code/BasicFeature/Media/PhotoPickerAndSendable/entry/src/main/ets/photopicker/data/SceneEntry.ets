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
 * Route identifiers shared by the home page and the router.
 * Keeping them in one class prevents typos between the navigation call and the route table.
 */
export class SceneRoutes {
  // Route key of the system photo picker page.
  public static readonly PICKER: string = 'picker';
  // Route key of the recent photos page.
  public static readonly RECENT: string = 'recent';
  // Route key of the gallery browsing page.
  public static readonly GALLERY: string = 'gallery';
  // Route key of the image editing page.
  public static readonly EDIT: string = 'edit';
  // Route key of the sandbox cache management page.
  public static readonly CACHE: string = 'cache';
}

/**
 * Navigation entry rendered on the home page.
 * The class only carries display data, so it intentionally contains no logic, logging or trace.
 */
export class SceneEntry {
  // Route key that the router should navigate to.
  public route: string;
  // Localized page title shown on the card.
  public title: Resource;
  // Localized one-line capability description shown under the title.
  public description: Resource;
  // Component id used by UI tests to find the entry card.
  public componentId: string;

  /**
   * Builds one home-page entry description.
   * @param route Route key defined in SceneRoutes.
   * @param title Localized title resource.
   * @param description Localized description resource.
   * @param componentId Component id used by the UI test driver.
   */
  constructor(route: string, title: Resource, description: Resource, componentId: string) {
    // Store the route key so the click handler can navigate without a lookup table.
    this.route = route;
    // Store the localized title resource for later resolution at render time.
    this.title = title;
    // Store the localized description resource for later resolution at render time.
    this.description = description;
    // Store the component id so UI tests can address this card directly.
    this.componentId = componentId;
  }
}
