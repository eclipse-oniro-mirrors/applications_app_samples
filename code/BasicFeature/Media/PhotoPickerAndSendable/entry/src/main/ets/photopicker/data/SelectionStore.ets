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

import { Logger } from 'photopickersendable';

// Module-scoped log tag so selection bookkeeping can be filtered out of the shared hilog stream.
const TAG: string = 'SelectionStore';
// Upper bound of the cross-scene selection, aligned with the system picker limit.
const MAX_SELECTION: number = 9;

/**
 * Cross-scene selection state shared by the picker, the gallery, the editor and the cache page.
 * The class is observed with V2 decorators, therefore the built-in @Trace decorator is used for
 * observable fields and the custom logger is imported without shadowing that decorator name.
 */
@ObservedV2
export class SelectionStore {
  // Ordered list of picked media uris; the order defines the export sequence.
  @Trace pickedUris: string[] = [];
  // Uri currently open in the editor, kept empty when nothing is being edited.
  @Trace editSource: string = '';

  /**
   * Returns the maximum number of items the user may pick at once.
   * @returns The hard limit configured for this sample.
   */
  maxSelection(): number {
    // The limit is a compile-time constant, so it is returned directly.
    return MAX_SELECTION;
  }

  /**
   * Returns how many items are currently selected.
   * @returns The current selection size.
   */
  count(): number {
    // Reading the array length is enough; no defensive copy is needed for a count.
    return this.pickedUris.length;
  }

  /**
   * Tells whether the given uri is already part of the selection.
   * @param uri Media uri to look up.
   * @returns True when the uri is already selected.
   */
  hasUri(uri: string): boolean {
    // indexOf keeps the lookup allocation free for the small selection sizes used here.
    return this.pickedUris.indexOf(uri) >= 0;
  }

  /**
   * Appends a uri to the selection while enforcing the size limit and de-duplication.
   * @param uri Media uri to add; empty strings and duplicates are ignored.
   */
  add(uri: string): void {
    // Reject empty input, duplicates and overflow in one guard to keep the state always valid.
    if (uri.length === 0 || this.hasUri(uri) || this.pickedUris.length >= MAX_SELECTION) {
      // Log the rejection reason as a count only, never the uri itself, to stay privacy safe.
      Logger.debug(TAG, 'add skipped, count: ' + this.pickedUris.length);
      // Leave the observable array untouched so no redundant re-render is triggered.
      return;
    }
    // Replace the array instead of mutating it so V2 observability fires exactly once.
    this.pickedUris = this.pickedUris.concat([uri]);
    // Log the new selection size to make picker interactions easy to follow in hilog.
    Logger.debug(TAG, 'add done, count: ' + this.pickedUris.length);
  }

  /**
   * Removes a uri from the selection and clears the editor source when it matches.
   * @param uri Media uri to remove; unknown uris are ignored.
   */
  remove(uri: string): void {
    // Rebuild the array so the observable list changes identity and notifies subscribers.
    this.pickedUris = this.pickedUris.filter((item: string): boolean => item !== uri);
    // Drop the editor pointer when the removed item is the one being edited.
    if (this.editSource === uri) {
      // Reset to an empty string so the editor page shows its empty state.
      this.editSource = '';
    }
    // Log the resulting size only, because the uri itself is user data.
    Logger.debug(TAG, 'remove done, count: ' + this.pickedUris.length);
  }

  /**
   * Marks a uri as the editor source and makes sure it is part of the selection.
   * @param uri Media uri that the editor page should open.
   */
  setEditSource(uri: string): void {
    // Remember the uri first so the editor can read it synchronously after navigation.
    this.editSource = uri;
    // Reuse the guarded add path to keep the selection limit logic in a single place.
    this.add(uri);
    // Log that the editor pointer moved; the uri is replaced by a fixed marker for privacy.
    Logger.info(TAG, 'setEditSource done');
  }

  /**
   * Returns the first selected uri, which is the default editor input.
   * @returns The first uri or an empty string when nothing is selected.
   */
  firstUri(): string {
    // Guard the index access so an empty selection never yields undefined.
    return this.pickedUris.length > 0 ? this.pickedUris[0] : '';
  }

  /**
   * Clears the whole selection, usually when the user leaves the sample flow.
   */
  clear(): void {
    // Reset the observable array so every subscriber drops its selected marks.
    this.pickedUris = [];
    // Reset the editor pointer so a stale uri cannot leak into the next session.
    this.editSource = '';
    // Log the reset so the end of a selection session is visible in hilog.
    Logger.info(TAG, 'clear done');
  }
}

// Single shared instance consumed by every page, which keeps the selection global to the app.
export const selectionStore: SelectionStore = new SelectionStore();
