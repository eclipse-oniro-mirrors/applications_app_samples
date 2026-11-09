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

import { Logger } from '../../utils/Logger';
import { Trace } from '../../utils/Trace';

/** Module tag used by every log line emitted from this file. */
const TAG: string = 'MediaThumb';

/**
 * Reusable rounded media thumbnail with an optional selection mark.
 * Colors and sizes are provided by the host page so the module keeps no resource dependency.
 */
@ComponentV2
export struct MediaThumb {
  /** Uri of the thumbnail source, provided by the host page. */
  @Param uri: string = '';
  /** True when the selection mark has to be drawn over the thumbnail. */
  @Param selected: boolean = false;
  /** Edge length of the square thumbnail in vp, passed as a string literal by the host page. */
  @Param itemSize: string = '96vp';
  /** Position of this thumbnail inside the host list, used to build stable ids. */
  @Param index: number = 0;
  /** Text drawn inside the selection mark, an empty text hides the mark. */
  @Param markText: string = '';
  /** Background colour of the selection mark. */
  @Param markColor: ResourceColor = '#FF0A59F7';
  /** Foreground colour of the selection mark text. */
  @Param markTextColor: ResourceColor = Color.White;
  /** Background colour shown while the thumbnail is still loading. */
  @Param placeholderColor: ResourceColor = '#FFE5E5E5';
  /** Corner radius shared by the thumbnail and the selection mark. */
  @Param cornerRadius: number = 8;
  /** Font size of the selection mark text. */
  @Param markFontSize: number = 12;
  /** Padding and margin applied around the selection mark. */
  @Param markPadding: number = 4;

  /**
   * Runs once the component is attached to the UI tree; the uri itself is not logged.
   */
  aboutToAppear(): void {
    Trace.withSync('MediaThumb.aboutToAppear', () => {
      // Record that one thumbnail node entered the tree, the index is enough to trace it.
      Logger.debug(TAG, 'aboutToAppear index: ' + String(this.index) + ', selected: ' + String(this.selected));
    });
  }

  /**
   * Runs once the component leaves the UI tree; used to close the lifecycle observation.
   */
  aboutToDisappear(): void {
    Trace.withSync('MediaThumb.aboutToDisappear', () => {
      // Record that one thumbnail node left the tree, the index is enough to trace it.
      Logger.debug(TAG, 'aboutToDisappear index: ' + String(this.index));
    });
  }

  /**
   * Builds the square thumbnail with the optional selection mark in the top end corner.
   */
  build() {
    // Stack keeps the image and the selection mark on top of each other.
    Stack({ alignContent: Alignment.TopEnd }) {
      // Image showing the thumbnail of the asset referenced by the uri.
      Image(this.uri)
        // Stable id used by the UI tests to locate the thumbnail image.
        .id(`id_thumb_image_${this.index}`)
        // Square geometry: same width and height as the host requested size.
        .width(this.itemSize)
        .height(this.itemSize)
        // Crop the source so the square stays filled without distortion.
        .objectFit(ImageFit.Cover)
        // Rounded corners shared with the selection mark.
        .borderRadius(this.cornerRadius)
        // Placeholder colour shown while the image is still decoding.
        .backgroundColor(this.placeholderColor)
      // Selection mark, drawn only while the host reports the item as selected.
      if (this.selected) {
        // Text carrying the selection order or the check mark glyph.
        Text(this.markText)
          // Stable id used by the UI tests to locate the selection mark.
          .id(`id_thumb_mark_${this.index}`)
          // Font size of the mark text provided by the host page.
          .fontSize(this.markFontSize)
          // Foreground colour of the mark text.
          .fontColor(this.markTextColor)
          // Background colour of the mark badge.
          .backgroundColor(this.markColor)
          // Rounded badge corners matching the thumbnail radius.
          .borderRadius(this.cornerRadius)
          // Inner padding so the glyph does not touch the badge edge.
          .padding(this.markPadding)
          // Outer margin so the badge keeps a gap to the image edge.
          .margin(this.markPadding)
      }
    }
    // Stable id used by the UI tests to locate the thumbnail container.
    .id(`id_thumb_stack_${this.index}`)
    // Square geometry of the container, identical to the image size.
    .width(this.itemSize)
    .height(this.itemSize)
  }
}
