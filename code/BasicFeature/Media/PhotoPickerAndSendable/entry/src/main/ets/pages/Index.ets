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

import { Logger, Trace } from 'photopickersendable';
import { selectionStore, SelectionStore } from '../photopicker/data/SelectionStore';
import { SceneEntry, SceneRoutes } from '../photopicker/data/SceneEntry';
import { PickerScene } from '../photopicker/pages/PickerScene';
import { RecentScene } from '../photopicker/pages/RecentScene';
import { GalleryScene } from '../photopicker/pages/GalleryScene';
import { EditScene } from '../photopicker/pages/EditScene';
import { CacheScene } from '../photopicker/pages/CacheScene';

// Module tag prefixed to every log line emitted by the home page.
const TAG: string = 'HomeIndex';
// Text of the chevron that marks an entry row as navigable.
const CHEVRON: string = '›';

/**
 * Home page of the sample: renders the scene entry list and hosts the navigation stack
 * that owns every picker scene destination.
 * Page routing and the shared selection state are the only observable actions here, they
 * are logged with the module tag and bracketed by a trace slice.
 */
@Entry
@ComponentV2
struct Index {
  /** Shared cross page selection store, the counter of the header reads from it. */
  private store: SelectionStore = selectionStore;
  /** Navigation stack holding the pushed scene destinations. */
  @Local pathStack: NavPathStack = new NavPathStack();
  /** Entry descriptors of every scene reachable from the home page. */
  private scenes: SceneEntry[] = [
    // Picker scene entry: opens the system full screen picker.
    new SceneEntry(SceneRoutes.PICKER, $r('app.string.pp_home_scene_picker_title'),
      $r('app.string.pp_home_scene_picker_desc'), 'id_home_scene_picker'),
    // Recent scene entry: shows the system recent photo component.
    new SceneEntry(SceneRoutes.RECENT, $r('app.string.pp_home_scene_recent_title'),
      $r('app.string.pp_home_scene_recent_desc'), 'id_home_scene_recent'),
    // Gallery scene entry: browses the whole media library.
    new SceneEntry(SceneRoutes.GALLERY, $r('app.string.pp_home_scene_gallery_title'),
      $r('app.string.pp_home_scene_gallery_desc'), 'id_home_scene_gallery'),
    // Edit scene entry: edits and exports the current selection.
    new SceneEntry(SceneRoutes.EDIT, $r('app.string.pp_home_scene_edit_title'),
      $r('app.string.pp_home_scene_edit_desc'), 'id_home_scene_edit'),
    // Cache scene entry: lists the exported files kept in the sandbox.
    new SceneEntry(SceneRoutes.CACHE, $r('app.string.pp_home_scene_cache_title'),
      $r('app.string.pp_home_scene_cache_desc'), 'id_home_scene_cache')
  ];

  /**
   * Lifecycle callback fired when the home page is about to appear.
   * Logs the entry once so the first frame is visible in the log stream.
   */
  aboutToAppear(): void {
    Trace.withSync('HomeIndex.aboutToAppear', () => {
      // Record the home page entry with the module tag.
      Logger.info(TAG, 'aboutToAppear scenes=' + String(this.scenes.length));
    });
  }

  /**
   * Navigation destination builder of the home page.
   * @param name Route name pushed onto the navigation stack.
   */
  @Builder
  pageMap(name: string) {
    // Picker route: render the picker scene.
    if (name === SceneRoutes.PICKER) {
      PickerScene()
    } else if (name === SceneRoutes.RECENT) {
      // Recent route: render the recent photo scene.
      RecentScene()
    } else if (name === SceneRoutes.GALLERY) {
      // Gallery route: render the media library scene.
      GalleryScene()
    } else if (name === SceneRoutes.EDIT) {
      // Edit route: render the editing scene.
      EditScene()
    } else if (name === SceneRoutes.CACHE) {
      // Cache route: render the sandbox cache scene.
      CacheScene()
    }
  }

  /**
   * Pushes the destination of the tapped scene entry onto the navigation stack.
   * @param route Route name of the tapped scene entry.
   */
  private openScene(route: string): void {
    Trace.withSync('HomeIndex.openScene', () => {
      Logger.info(TAG, 'openScene route=' + route);
      // Push the destination onto the stack; no extra parameters are passed.
      this.pathStack.pushPathByName(route, null);
    });
  }

  /**
   * Clears the shared selection store from the header button.
   */
  private clearSelection(): void {
    Trace.withSync('HomeIndex.clearSelection', () => {
      Logger.info(TAG, 'clearSelection count=' + String(this.store.count()));
      // Drop every picked uri from the shared store.
      this.store.clear();
    });
  }

  /**
   * Builds the home page: title, subtitle, selection counter row and the scene entry list.
   */
  build() {
    // Navigation container that owns the scene destinations.
    Navigation(this.pathStack) {
      // Scroll container so the entry list stays reachable on small screens.
      Scroll() {
        // Root vertical container of the page, spaced by 12vp.
        Column({ space: '12vp' }) {
          // Application title text.
          Text($r('app.string.pp_app_title'))
            .id('id_home_title')
            // Title sized bold primary text, full width.
            .fontSize($r('app.float.pp_font_title'))
            .fontWeight(FontWeight.Bold)
            .fontColor($r('app.color.pp_text_primary'))
            .width('100%')
          // Application subtitle text.
          Text($r('app.string.pp_home_subtitle'))
            .id('id_home_subtitle')
            // Caption sized secondary text, full width.
            .fontSize($r('app.float.pp_font_caption'))
            .fontColor($r('app.color.pp_text_secondary'))
            .width('100%')

          // Counter row holding the selected counter and the clear button.
          Row({ space: '12vp' }) {
            // Counter text carrying the current number of selected items.
            Text($r('app.string.pp_home_selected', this.store.count()))
              .id('id_home_selected_count')
              // Body sized primary text that absorbs the free horizontal space.
              .fontSize($r('app.float.pp_font_body'))
              .fontColor($r('app.color.pp_text_primary'))
              .layoutWeight(1)
            // Button that clears the shared selection store.
            Button($r('app.string.pp_home_clear'))
              .id('id_home_clear')
              // Compact capsule button with a card background and the secondary label colour.
              .type(ButtonType.Capsule)
              .backgroundColor($r('app.color.pp_card'))
              .fontColor($r('app.color.pp_text_secondary'))
              .fontSize($r('app.float.pp_font_caption'))
              .height($r('app.float.pp_button_height'))
              // Clears the shared selection store.
              .onClick(() => this.clearSelection())
          }
          // Counter row: full width, inner padding, card background and rounded corners.
          .width('100%')
          .padding('12vp')
          .backgroundColor($r('app.color.pp_card'))
          .borderRadius($r('app.float.pp_radius_m'))

          // Section title text above the scene entry list.
          Text($r('app.string.pp_home_section_scenes'))
            .id('id_home_section')
            // Section sized medium weight primary text, full width, with a small top margin.
            .fontSize($r('app.float.pp_font_section'))
            .fontWeight(FontWeight.Medium)
            .fontColor($r('app.color.pp_text_primary'))
            .width('100%')
            .margin({ top: $r('app.float.pp_space_s') })

          // Column acting as the entry list so a non virtual container stays scrollable.
          Column({ space: '12vp' }) {
            // Render one navigable card per scene entry.
            Repeat<SceneEntry>(this.scenes)
              .each((repeatItem: RepeatItem<SceneEntry>) => {
                // One card per scene entry.
                Row({ space: '12vp' }) {
                  // Column holding the entry title and the entry description.
                  Column({ space: '4vp' }) {
                    // Title of the scene entry.
                    Text(repeatItem.item.title)
                      .id('id_home_scene_title_' + repeatItem.index)
                      // Body sized medium weight primary text, full width.
                      .fontSize($r('app.float.pp_font_body'))
                      .fontWeight(FontWeight.Medium)
                      .fontColor($r('app.color.pp_text_primary'))
                      .width('100%')
                    // Description of the scene entry.
                    Text(repeatItem.item.description)
                      .id('id_home_scene_desc_' + repeatItem.index)
                      // Caption sized secondary text, full width.
                      .fontSize($r('app.float.pp_font_caption'))
                      .fontColor($r('app.color.pp_text_secondary'))
                      .width('100%')
                  }
                  // Let the text column absorb the free horizontal space, left aligned.
                  .layoutWeight(1)
                  .alignItems(HorizontalAlign.Start)
                  // Chevron telling the user that the row opens another page.
                  Text(CHEVRON)
                    // Section sized secondary coloured chevron.
                    .fontSize($r('app.float.pp_font_section'))
                    .fontColor($r('app.color.pp_text_secondary'))
                }
                .id(repeatItem.item.componentId)
                // Entry card: full width, inner padding, card background and rounded corners.
                .width('100%')
                .padding('16vp')
                .backgroundColor($r('app.color.pp_card'))
                .borderRadius($r('app.float.pp_radius_m'))
                // Opens the scene the tapped entry points at.
                .onClick(() => {
                  // Navigate to the route of the tapped entry.
                  this.openScene(repeatItem.item.route);
                })
              })
              // Identity of each repeated card, derived from the route of the entry.
              .key((item: SceneEntry): string => item.route)
          }
          // Entry list column: full width, top aligned items.
          .width('100%')
          .alignItems(HorizontalAlign.Start)
        }
        // Content column: full width, page padding and top aligned items.
        .width('100%')
        .padding('16vp')
        .alignItems(HorizontalAlign.Start)
      }
      .id('id_home_scroll')
      // Scroll container: full size, top start alignment and no scrollbar.
      .width('100%')
      .height('100%')
      .align(Alignment.TopStart)
      .scrollBar(BarState.Off)
    }
    .id('id_home_navigation')
    // Route table of the navigation stack and the stack display mode.
    .navDestination(this.pageMap)
    .mode(NavigationMode.Stack)
    // Hide the default title bar so the page renders its own header.
    .hideTitleBar(true)
    // Page background colour behind the navigation container.
    .backgroundColor($r('app.color.pp_bg_page'))
  }
}
